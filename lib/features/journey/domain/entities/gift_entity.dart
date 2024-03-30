import 'package:equatable/equatable.dart';

class GiftEntity extends Equatable {
  final int? giftId;
  final String? giftURL;
  final String? content;
  final int? type;
  final String? createdAt;
  final String? updatedAt;

  const GiftEntity({this.giftId, this.giftURL, this.content, this.type, this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [giftId, giftURL, content, type, createdAt, updatedAt];
}
