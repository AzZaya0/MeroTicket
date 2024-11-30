part of 'login_cubit.dart';

enum LoginStatus { loading, loaded, error }

class LoginState extends Equatable {
  const LoginState(
      {this.loginStatus,
      this.organizationCategoryModel,
      this.categoryNameList});
  final LoginStatus? loginStatus;
  final OrganizationCategoryModel? organizationCategoryModel;
  final List<String>? categoryNameList;

  LoginState copyWith(
      {LoginStatus? loginStatus,
      OrganizationCategoryModel? organizationCategoryModel,
      List<String>? categoryNameList}) {
    return LoginState(
        loginStatus: loginStatus ?? this.loginStatus,
        organizationCategoryModel:
            organizationCategoryModel ?? this.organizationCategoryModel,
        categoryNameList: categoryNameList ?? this.categoryNameList);
  }

  @override
  List<Object?> get props => [
        loginStatus,
        organizationCategoryModel,
        categoryNameList,
      ];
}
