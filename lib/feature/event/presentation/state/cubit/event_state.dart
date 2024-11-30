part of 'event_cubit.dart';

enum EventStatus { initial, loading, loaded, error }

class EventState extends Equatable {
  EventState(
      {this.eventStatus = EventStatus.initial,
      this.vendorData,
      this.selectedVendors,
      this.selectedVendorsIds,
      this.allEventsModel,
      this.myEventsModel});
  final EventStatus eventStatus;
  final List<Datum>? vendorData;
  final List<Datum>? selectedVendors;
  final List<int?>? selectedVendorsIds;
  final AllEvents.AllEventsModel? allEventsModel;
  final M_Events.MyEventsModel? myEventsModel;
  EventState copyWith(
      {EventStatus? eventStatus,
      List<Datum>? vendorData,
      List<Datum>? selectedVendors,
      M_Events.MyEventsModel? myEventsModel,
      AllEvents.AllEventsModel? allEventsModel,
      List<int?>? selectedVendorsIds}) {
    return EventState(
        eventStatus: eventStatus ?? this.eventStatus,
        vendorData: vendorData ?? this.vendorData,
        allEventsModel: allEventsModel ?? this.allEventsModel,
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
        allEventsModel,
        myEventsModel
      ];
}
