part of 'register_user_cubit.dart';

sealed class RegisterUserState {}

final class RegisterInitial extends RegisterUserState {}

final class RegisterLoading extends RegisterUserState {}

final class RegisterSucces extends RegisterUserState {}

final class RegisterFailure extends RegisterUserState {
  final String errorMessage;

  RegisterFailure({required this.errorMessage});
}
