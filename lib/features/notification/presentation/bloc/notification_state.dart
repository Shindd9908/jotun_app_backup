part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {}

final class NotificationInitial extends NotificationState {
  @override
  List<Object?> get props => [];
}

class GetListNotificationInitial extends NotificationState {
  @override
  List<Object?> get props => [];
}

class GetListNotificationLoading extends NotificationState {
  @override
  List<Object?> get props => [];
}

class GetListNotificationSuccess extends NotificationState {
  final NotificationDataEntity notificationDataEntity;

  GetListNotificationSuccess({required this.notificationDataEntity});

  @override
  List<Object?> get props => [notificationDataEntity];
}

class GetListNotificationFailure extends NotificationState {
  final String message;

  GetListNotificationFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
