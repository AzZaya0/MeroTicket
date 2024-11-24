part of 'main_nav_cubit.dart';

sealed class MainNavState extends Equatable {
  const MainNavState(this.index);
  final int index;
  @override
  List<Object> get props => [index];
}

final class MainNavInitial extends MainNavState {
  const MainNavInitial(super.index);
  @override
  List<Object> get props => [index];
}
