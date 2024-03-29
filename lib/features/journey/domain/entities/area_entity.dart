import 'package:equatable/equatable.dart';

class AreaCompletedEntity extends Equatable {
  final int? areaId;
  final String? completedAt;

  const AreaCompletedEntity({this.areaId, this.completedAt});

  @override
  List<Object?> get props => [areaId, completedAt];
}

class AreaEntity extends Equatable {
  final int? areaId;
  final String? areaName;
  final String? areaTitle;
  final String? areaImage;
  final String? areaCode;
  final List<QuestionEntity>? questions;
  final List<TripEntity>? trips;
  final bool? unlock;

  const AreaEntity({this.areaId, this.areaName, this.areaTitle, this.areaImage, this.areaCode, this.questions, this.trips, this.unlock});

  @override
  List<Object?> get props => [areaId, areaName, areaTitle, areaImage, areaCode, questions, trips, unlock];
}

class QuestionEntity extends Equatable {
  final String? title;
  final List<AnswerEntity>? answers;

  const QuestionEntity({this.title, this.answers});

  @override
  List<Object?> get props => [title, answers];
}

class AnswerEntity extends Equatable {
  final String? answer;
  final bool? correct;

  const AnswerEntity({this.answer, this.correct});

  @override
  List<Object?> get props => [answer, correct];
}

class TripEntity extends Equatable {
  final String? name;
  final String? title;
  final String? eventDate;
  final String? image;
  final List<ScheduleEntity>? schedules;

  const TripEntity({this.name, this.title, this.eventDate, this.image, this.schedules});

  @override
  List<Object?> get props => [name, title, eventDate, image, schedules];
}

class ScheduleEntity extends Equatable {
  final String? content;
  final String? timeStart;
  final String? time;
  final String? address;
  final String? note;
  final int? free;
  final int? shift;
  final String? shiftName;
  final String? groups;

  const ScheduleEntity({this.content, this.timeStart, this.time, this.address, this.note, this.free, this.shift, this.shiftName, this.groups});

  @override
  List<Object?> get props => [content, timeStart, time, address, note, free, shift, shiftName, groups];
}
