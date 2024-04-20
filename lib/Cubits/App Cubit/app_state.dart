// ignore_for_file: camel_case_types

part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitialState extends AppState {}

final class changePageState extends AppState {}

final class loadingGetUserState extends AppState {}
final class successGetUserState extends AppState {}
final class failedGetUserState extends AppState {
  final String error;
  failedGetUserState(this.error);
}

final class pickingImageState extends AppState {}
final class successPickingImageState extends AppState {}

final class uploadingPostImageState extends AppState {}
final class successUploadingPostImageState extends AppState {}
final class failedUploadingPostImageState extends AppState {}

final class uploadingPostState extends AppState {}
final class successUploadingPostState extends AppState {}
final class failedUploadingPostState extends AppState {}

final class loadingGettingPostState extends AppState {}
final class successGettingPostState extends AppState {}
final class failedGettingPostState extends AppState {
  final String error;
  failedGettingPostState(this.error);
}
final class loadingGettingClubsState extends AppState {}
final class successGettingClubsState extends AppState {}
final class failedGettingClubsState extends AppState {
  final String error;
  failedGettingClubsState(this.error);
}

final class removedPostImageState extends AppState {}


