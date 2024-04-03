part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}

class GetListNotificationEvent extends NotificationEvent {}
