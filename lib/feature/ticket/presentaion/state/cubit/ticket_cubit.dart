import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:template/feature/event/data/models/my_tickets_model.dart';
import 'package:template/feature/event/data/repository/event_repo.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit(this.eventRepo) : super(TicketState());
  bool hasTicket = true;
  final EventRepo eventRepo;

  void getMyTickets() async {
    emit(state.copyWith(ticketStatus: TicketStatus.loading));
    var response = await eventRepo.getMyTickets();
    response.fold(
      (l) {
        emit(state.copyWith(
            ticketStatus: TicketStatus.loaded, myTicketsModel: l));
      },
      (r) {
        emit(state.copyWith(ticketStatus: TicketStatus.error));
      },
    );
  }

// getMyTickets
}
