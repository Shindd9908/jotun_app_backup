import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'notification_detail_model.dart';

part 'notification_data_model.g.dart';

@JsonSerializable()
class NotificationDataModel extends Equatable{
  @JsonKey(name: "unread")
  final int? unread;
  @JsonKey(name: "notifications")
  final List<NotificationsDetailModel>? notificationsDetailModel;

  const NotificationDataModel({
    this.unread,
    this.notificationsDetailModel,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) => _$NotificationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataModelToJson(this);

  @override
  List<Object?> get props => [unread, notificationsDetailModel,];
}
