part of 'event_cubit.dart';

enum EventStatus { initial, loading, loaded, error }

class EventState extends Equatable {
  EventState(
      {this.eventStatus = EventStatus.initial,
      this.vendorData,
      this.selectedVendors,
      this.selectedVendorsIds,
      this.allEventsModel,
      this.getEventById,
      this.myEventsModel});
  final EventStatus eventStatus;
  final List<Datum>? vendorData;
  final List<Datum>? selectedVendors;
  final List<int?>? selectedVendorsIds;
  final all_events.AllEventsModel? allEventsModel;
  final M_Events.MyEventsModel? myEventsModel;
  final GetEventById? getEventById;
  EventState copyWith(
      {EventStatus? eventStatus,
      List<Datum>? vendorData,
      List<Datum>? selectedVendors,
      M_Events.MyEventsModel? myEventsModel,
      all_events.AllEventsModel? allEventsModel,
      GetEventById? getEventById,
      List<int?>? selectedVendorsIds}) {
    return EventState(
        eventStatus: eventStatus ?? this.eventStatus,
        vendorData: vendorData ?? this.vendorData,
        getEventById: getEventById ?? this.getEventById,
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
        getEventById,
        myEventsModel
      ];
}
