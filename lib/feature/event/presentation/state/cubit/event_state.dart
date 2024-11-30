part of 'event_cubit.dart';

enum EventStatus { initial, loading, loaded, error }

class EventState extends Equatable {
  EventState(
      {this.eventStatus = EventStatus.initial,
      this.vendorData,
      this.selectedVendors,
      this.selectedVendorsIds,
      this.myEventsModel});
  final EventStatus eventStatus;
  final List<Datum>? vendorData;
  final List<Datum>? selectedVendors;
  final List<int?>? selectedVendorsIds;
  final M_Events.MyEventsModel? myEventsModel;
  EventState copyWith(
      {EventStatus? eventStatus,
      List<Datum>? vendorData,
      List<Datum>? selectedVendors,
      M_Events.MyEventsModel? myEventsModel,
      List<int?>? selectedVendorsIds}) {
    return EventState(
        eventStatus: eventStatus ?? this.eventStatus,
        vendorData: vendorData ?? this.vendorData,
        selectedVendorsIds: selectedVendorsIds ?? this.selectedVendorsIds,
        selectedVendors: selectedVendors ?? this.selectedVendors,
        myEventsModel: myEventsModel ?? this.myEventsModel);
  }

  @override
  List<Object?> get props => [
        eventStatus,
        vendorData,
        selectedVendors,
        selectedVendorsIds,
        myEventsModel
      ];
}
