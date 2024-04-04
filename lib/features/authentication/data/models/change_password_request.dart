import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest extends Equatable {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "role")
  final int? role;
  @JsonKey(name: "old_password")
  final String? oldPassword;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "password_confirmation")
  final String? passwordConfirmation;

  const ChangePasswordRequest({this.oldPassword, this.password, this.passwordConfirmation, this.username, this.role});

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) => _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);

  @override
  List<Object?> get props => [username, role, oldPassword, password, passwordConfirmation];
}
