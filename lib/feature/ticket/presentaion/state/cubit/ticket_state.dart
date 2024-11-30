part of 'ticket_cubit.dart';

enum TicketStatus { initial, loading, loaded, error }

class TicketState extends Equatable {
  const TicketState(
      {this.ticketStatus = TicketStatus.initial, this.myTicketsModel});

  final TicketStatus ticketStatus;
  final MyTicketsModel? myTicketsModel;
  TicketState copyWith(
      {TicketStatus? ticketStatus, MyTicketsModel? myTicketsModel}) {
    return TicketState(
        ticketStatus: ticketStatus ?? this.ticketStatus,
        myTicketsModel: myTicketsModel ?? this.myTicketsModel);
  }

  @override
  List<Object?> get props => [ticketStatus, myTicketsModel];
}
