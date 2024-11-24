import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_nav_state.dart';

class MainNavCubit extends Cubit<MainNavState> {
  MainNavCubit() : super(const MainNavInitial(0));
  void changePage(i) {
    emit(MainNavInitial(i));
  }
}
