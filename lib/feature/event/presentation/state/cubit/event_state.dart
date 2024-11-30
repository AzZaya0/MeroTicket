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
      this.ticketType,
      this.searchedModel,
      this.myEventsModel});
  final EventStatus eventStatus;
  final List<Datum>? vendorData;
  final List<Datum>? selectedVendors;
  final List<int?>? selectedVendorsIds;
  final all_events.AllEventsModel? allEventsModel;
  final M_Events.MyEventsModel? myEventsModel;
  final GetEventById? getEventById;
  final all_events.AllEventsModel? searchedModel;
  final List<TicketType?>? ticketType;
  EventState copyWith(
      {EventStatus? eventStatus,
      List<Datum>? vendorData,
      List<Datum>? selectedVendors,
      M_Events.MyEventsModel? myEventsModel,
      all_events.AllEventsModel? allEventsModel,
      all_events.AllEventsModel? searchedModel,
      GetEventById? getEventById,
      List<TicketType?>? ticketType,
      List<int?>? selectedVendorsIds}) {
    return EventState(
        searchedModel: searchedModel ?? this.searchedModel,
        eventStatus: eventStatus ?? this.eventStatus,
        vendorData: vendorData ?? this.vendorData,
        getEventById: getEventById ?? this.getEventById,
        allEventsModel: allEventsModel ?? this.allEventsModel,
        selectedVendorsIds: selectedVendorsIds ?? this.selectedVendorsIds,
        selectedVendors: selectedVendors ?? this.selectedVendors,
        ticketType: ticketType ?? this.ticketType,
        myEventsModel: myEventsModel ?? this.myEventsModel);
  }

  @override
  List<Object?> get props => [
        eventStatus,
        vendorData,
        selectedVendors,
        selectedVendorsIds,
        allEventsModel,
        searchedModel,
        getEventById,
        ticketType,
        myEventsModel
      ];
}
