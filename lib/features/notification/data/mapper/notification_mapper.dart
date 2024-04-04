import 'package:jotub_app/features/notification/data/models/response/notification_data_model.dart';
import 'package:jotub_app/features/notification/data/models/response/notification_detail_model.dart';
import 'package:jotub_app/features/notification/domain/entities/notification_detail_entity.dart';
import 'package:jotub_app/features/notification/domain/entities/notification_entity.dart';

extension NotificationDataExtensions on NotificationsDetailModel {
  NotificationsDetailEntity get notificationDetailEntity => NotificationsDetailEntity(
        id: id,
        type: type,
        title: title,
        content: content,
        pushTime: pushTime,
        createdAt: createdAt,
        status: status,
      );
}

extension ListNotificationDataExtensions on NotificationDataModel {
  NotificationDataEntity get notificationEntity => NotificationDataEntity(
        unread: unread,
        notificationsDetailEntity: notificationsDetailModel?.map((e) => e.notificationDetailEntity).toList(),
      );
}
