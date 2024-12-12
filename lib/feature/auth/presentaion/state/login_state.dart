part of 'login_cubit.dart';

enum LoginStatus { loading, loaded, error }

class LoginState extends Equatable {
  const LoginState(
      {this.loginStatus,
      this.loginData,
      this.organizationCategoryModel,
      this.categoryNameList});
  final LoginStatus? loginStatus;
  final OrganizationCategoryModel? organizationCategoryModel;
  final List<String>? categoryNameList;
  final LoginModel? loginData;

  LoginState copyWith(
      {LoginStatus? loginStatus,
      LoginModel? loginData,
      OrganizationCategoryModel? organizationCategoryModel,
      List<String>? categoryNameList}) {
    return LoginState(
        loginData: loginData ?? this.loginData,
        loginStatus: loginStatus ?? this.loginStatus,
        organizationCategoryModel:
            organizationCategoryModel ?? this.organizationCategoryModel,
        categoryNameList: categoryNameList ?? this.categoryNameList);
  }

  @override
  List<Object?> get props => [
        loginStatus,
        organizationCategoryModel,
        loginData,
        categoryNameList,
      ];
}
