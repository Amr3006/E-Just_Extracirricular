// ignore_for_file: camel_case_types, empty_constructor_bodies

part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class changeObscurityState extends AuthState {}

final class changeIndexState extends AuthState {}

final class loadingCreatingUserState extends AuthState {}
final class successCreatingUserState extends AuthState {}
final class failedCreatingUserState extends AuthState {
  final String error;
  failedCreatingUserState(this.error);
  }

final class loadingLogInState extends AuthState {}
final class successLogInState extends AuthState {}
final class failedLogInState extends AuthState {
  final String error;
  failedLogInState(this.error);
  }


