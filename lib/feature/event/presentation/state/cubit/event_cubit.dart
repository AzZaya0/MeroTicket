import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:template/feature/event/data/models/all_events_model.dart '
    as AllEvents;
import 'package:template/feature/event/data/models/my_events_model.dart'
    as M_Events;
import 'package:template/feature/event/data/repository/event_repo.dart';

import '../../../../../config/constants/asset_manager.dart';
import '../../../data/models/search_vendor_model.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit(this.eventRepo) : super(EventState());
  final EventRepo eventRepo;
  String formatTimeOfDay(TimeOfDay timeOfDay) {
    // Create a DateTime object with the current date and the time from TimeOfDay
    final now = DateTime.now();
    final dt = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);

    // Format it to the desired format
    return DateFormat('hh:mm a').format(dt);
  }

  createEvent(
      {required BuildContext context,
      required File? eventImage,
      required String title,
      required String description,
      required String address,
      required String category}) async {
    //
    if (eventImage != null) {
      EasyLoading.show(
        indicator: lottieLoader(
            ctx: context,
            lottieAsset: LottieAssets.ticketLoadingLottie,
            fit: BoxFit.fitHeight,
            height: 200),
        maskType: EasyLoadingMaskType.clear,
      );
      var startDate = finalEventDateRange?.start;
      var endDate = finalEventDateRange?.end;
      String formattedStartDate =
          DateFormat('yyyy/MM/dd').format(startDate ?? DateTime.now());
      String formattedEndDate =
          DateFormat('yyyy/MM/dd').format(endDate ?? DateTime.now());

      var response = await eventRepo.createEvent(
          imageFile: eventImage,
          address: address,
          category: category,
          description: description,
          endDate: formattedEndDate,
          endTime: formatTimeOfDay(
            endTime ?? TimeOfDay(hour: 23, minute: 59),
          ),
          eventVenderId: selectedVendorsIds,
          startDate: formattedStartDate,
          startTime: formatTimeOfDay(
            startTime ?? TimeOfDay(hour: 0, minute: 00),
          ),
          title: title);
      EasyLoading.dismiss();
      Navigator.of(context).pop();
      // response.fold(ifLeft, ifRight);
    } else {}
  }

  DateTimeRange? finalEventDateRange;

  setEventDate({DateTimeRange? eventDateRange}) {
    finalEventDateRange = eventDateRange;
  }

  TimeOfDay? startTime;
  TimeOfDay? endTime;
  setTime(bool isStart, TimeOfDay? time) {
    isStart ? startTime = time : endTime = time;
  }

//
  List<Datum>? selectedVendors = [];
  List<int?> selectedVendorsIds = [];
  searchVendors(String query) async {
    var response = await eventRepo.searchVendor(query: query);

    return response.fold(
      (l) {
        emit(state.copyWith(vendorData: l?.data));
        return l;
      },
      (error) {
        return null;
      },
    );
  }

  void selectVendor(Datum? vendor) {
    if (vendor != null) {
      selectedVendors ??= [];

      // Add vendor only if it's not already in the list
      if (!selectedVendors!.contains(vendor)) {
        selectedVendors!.add(vendor);
        selectedVendorsIds.add(vendor.id);

        // Debug prints
        print(selectedVendors);
        print(selectedVendorsIds);

        // Emit updated state
        emit(state.copyWith(
          selectedVendors: List.of(selectedVendors!), // Emit a new list
          selectedVendorsIds: List.of(selectedVendorsIds), // Emit a new list
        ));
      }
    }
  }

  clearVendor() {
    emit(state.copyWith(vendorData: []));
  }

  void removeVendorFromList(Datum? specificVendor) {
    if (selectedVendors?.contains(specificVendor) ?? false) {
      // Create a new list with selected vendors, copy the original list
      var newVendorList = List<Datum>.from(selectedVendors!);
      var newVendorsIdList = List<int>.from(selectedVendorsIds);

      // Remove the specific vendor
      newVendorList.remove(specificVendor);
      newVendorsIdList.remove(specificVendor?.id);
      selectedVendors = newVendorList;
      selectedVendorsIds = newVendorsIdList;
      // Emit the new state with the updated selectedVendors list
      emit(state.copyWith(
          selectedVendors: newVendorList,
          selectedVendorsIds: newVendorsIdList));
    }
  }

  // M_Events.MyEventsModel? myEventsModel;
  //
  getMyEvents() async {
    emit(state.copyWith(eventStatus: EventStatus.loading));
    var response = await eventRepo.getMyEvents();
    response.fold(
      (l) {
        emit(state.copyWith(eventStatus: EventStatus.loaded, myEventsModel: l));
      },
      (r) {
        emit(state.copyWith(eventStatus: EventStatus.error));
      },
    );
  }

  getAllEvents() async {
    // emit(state.copyWith(eventStatus: EventStatus.loading));
    var response = await eventRepo.getAllEvents();
    response.fold(
      (l) {
        emit(
            state.copyWith(eventStatus: EventStatus.loaded, allEventsModel: l));
      },
      (r) {
        emit(state.copyWith(eventStatus: EventStatus.error));
      },
    );
  }
}