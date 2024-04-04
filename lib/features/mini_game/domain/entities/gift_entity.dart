import 'package:equatable/equatable.dart';

class GiftEntity extends Equatable {
  final int? giftId;
  final String? giftUrl;
  final String? content;
  final String? createdAt;
  final String? updatedAt;

  const GiftEntity({
    this.giftId,
    this.giftUrl,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        giftId,
        giftUrl,
        content,
        createdAt,
        updatedAt,
      ];
}
