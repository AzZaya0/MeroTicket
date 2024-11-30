part of 'ticket_cubit.dart';

enum TicketStatus { initial, loading, loaded }

class TicketState extends Equatable {
  const TicketState({this.ticketStatus = TicketStatus.initial});

  final TicketStatus ticketStatus;
  TicketState copyWith({TicketStatus? ticketStatus}) {
    return TicketState(ticketStatus: ticketStatus ?? this.ticketStatus);
  }

  @override
  List<Object?> get props => [ticketStatus];
}
