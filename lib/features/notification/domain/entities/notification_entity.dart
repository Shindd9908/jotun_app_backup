import 'package:equatable/equatable.dart';

import 'notification_detail_entity.dart';

class NotificationDataEntity extends Equatable {
  final int? unread;
  final List<NotificationsDetailEntity>? notificationsDetailEntity;

  const NotificationDataEntity({
    this.unread,
    this.notificationsDetailEntity,
  });

  @override
  List<Object?> get props => [unread, notificationsDetailEntity];
}
