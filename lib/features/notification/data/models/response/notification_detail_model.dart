import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_detail_model.g.dart';

@JsonSerializable()
class NotificationsDetailModel extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "type")
  final int? type;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "content")
  final String? content;
  @JsonKey(name: "push_time")
  final String? pushTime;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "status")
  final int? status;

  const NotificationsDetailModel({
    this.id,
    this.type,
    this.title,
    this.content,
    this.pushTime,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  factory NotificationsDetailModel.fromJson(Map<String, dynamic> json) => _$NotificationsDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsDetailModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        type,
        title,
        content,
        pushTime,
        createdAt,
        updatedAt,
        status,
      ];
}
