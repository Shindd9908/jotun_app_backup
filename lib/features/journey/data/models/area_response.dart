import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "area_response.g.dart";

@JsonSerializable()
class AreaCompletedResponse extends Equatable {
  @JsonKey(name: "area_id")
  final int? areaId;
  @JsonKey(name: "completed_at")
  final String? completedAt;

  const AreaCompletedResponse({this.areaId, this.completedAt});

  factory AreaCompletedResponse.fromJson(Map<String, dynamic> json) => _$AreaCompletedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AreaCompletedResponseToJson(this);

  @override
  List<Object?> get props => [areaId, completedAt];
}

@JsonSerializable()
class AreaResponse extends Equatable {
  @JsonKey(name: "id")
  final int? areaId;
  @JsonKey(name: "name")
  final String? areaName;
  @JsonKey(name: "title")
  final String? areaTitle;
  @JsonKey(name: "image")
  final String? areaImage;
  @JsonKey(name: "area_code")
  final String? areaCode;
  @JsonKey(name: "questions")
  final List<QuestionResponse>? questions;
  @JsonKey(name: "trips")
  final TripResponse? trip;

  const AreaResponse({this.areaId, this.areaName, this.areaTitle, this.areaImage, this.areaCode, this.questions, this.trip});

  factory AreaResponse.fromJson(Map<String, dynamic> json) => _$AreaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AreaResponseToJson(this);

  @override
  List<Object?> get props => [areaId, areaName, areaTitle, areaImage, areaCode, questions, trip];
}

@JsonSerializable()
class QuestionResponse extends Equatable {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "answers")
  final List<AnswerResponse>? answers;

  const QuestionResponse({this.title, this.answers});

  factory QuestionResponse.fromJson(Map<String, dynamic> json) => _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);

  @override
  List<Object?> get props => [title, answers];
}

@JsonSerializable()
class AnswerResponse extends Equatable {
  @JsonKey(name: "answer")
  final String? answer;
  @JsonKey(name: "correct")
  final bool? correct;

  const AnswerResponse({this.answer, this.correct});

  factory AnswerResponse.fromJson(Map<String, dynamic> json) => _$AnswerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerResponseToJson(this);

  @override
  List<Object?> get props => [answer, correct];
}

@JsonSerializable()
class TripResponse extends Equatable {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "event_date")
  final String? eventDate;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "schedules")
  final List<ScheduleResponse>? schedules;

  const TripResponse({this.name, this.title, this.eventDate, this.image, this.schedules});

  factory TripResponse.fromJson(Map<String, dynamic> json) => _$TripResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TripResponseToJson(this);

  @override
  List<Object?> get props => [name, title, eventDate, image, schedules];
}

@JsonSerializable()
class ScheduleResponse extends Equatable {
  @JsonKey(name: "content")
  final String? content;
  @JsonKey(name: "time_start")
  final String? timeStart;
  @JsonKey(name: "time")
  final String? time;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "note")
  final String? note;
  @JsonKey(name: "free")
  final int? free;
  @JsonKey(name: "shift")
  final int? shift;
  @JsonKey(name: "shift_name")
  final String? shiftName;
  @JsonKey(name: "groups")
  final String? groups;

  const ScheduleResponse({this.content, this.timeStart, this.time, this.address, this.note, this.free, this.shift, this.shiftName, this.groups});

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) => _$ScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleResponseToJson(this);

  @override
  List<Object?> get props => [content, timeStart, time, address, note, free, shift, shiftName, groups];
}
