import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketState());
  bool hasTicket = true;


  
}
