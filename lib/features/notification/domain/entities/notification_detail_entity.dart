import 'package:equatable/equatable.dart';

class NotificationsDetailEntity extends Equatable {
  final int? id;
  final int? type;
  final String? title;
  final String? content;
  final String? pushTime;
  final String? createdAt;
  final String? updatedAt;
  final int? status;

  const NotificationsDetailEntity({
    this.id,
    this.type,
    this.title,
    this.content,
    this.pushTime,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

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
