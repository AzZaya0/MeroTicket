part of 'login_cubit.dart';

enum LoginStatus { loading, loaded, error }

class LoginState extends Equatable {
  const LoginState({this.loginStatus});
  final LoginStatus? loginStatus;

  LoginState copyWith({LoginStatus? loginStatus}) {
    return LoginState(loginStatus: loginStatus ?? this.loginStatus);
  }

  @override
  List<Object?> get props => [loginStatus];
}
