// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaCompletedResponse _$AreaCompletedResponseFromJson(
        Map<String, dynamic> json) =>
    AreaCompletedResponse(
      areaId: json['area_id'] as int?,
      completedAt: json['completed_at'] as String?,
    );

Map<String, dynamic> _$AreaCompletedResponseToJson(
        AreaCompletedResponse instance) =>
    <String, dynamic>{
      'area_id': instance.areaId,
      'completed_at': instance.completedAt,
    };

AreaResponse _$AreaResponseFromJson(Map<String, dynamic> json) => AreaResponse(
      areaId: json['id'] as int?,
      areaName: json['name'] as String?,
      areaTitle: json['title'] as String?,
      areaImage: json['image'] as String?,
      areaCode: json['area_code'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      trip: json['trips'] == null
          ? null
          : TripResponse.fromJson(json['trips'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AreaResponseToJson(AreaResponse instance) =>
    <String, dynamic>{
      'id': instance.areaId,
      'name': instance.areaName,
      'title': instance.areaTitle,
      'image': instance.areaImage,
      'area_code': instance.areaCode,
      'questions': instance.questions,
      'trips': instance.trip,
    };

QuestionResponse _$QuestionResponseFromJson(Map<String, dynamic> json) =>
    QuestionResponse(
      title: json['title'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswerResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionResponseToJson(QuestionResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'answers': instance.answers,
    };

AnswerResponse _$AnswerResponseFromJson(Map<String, dynamic> json) =>
    AnswerResponse(
      answer: json['answer'] as String?,
      correct: json['correct'] as bool?,
    );

Map<String, dynamic> _$AnswerResponseToJson(AnswerResponse instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'correct': instance.correct,
    };

TripResponse _$TripResponseFromJson(Map<String, dynamic> json) => TripResponse(
      name: json['name'] as String?,
      title: json['title'] as String?,
      eventDate: json['event_date'] as String?,
      image: json['image'] as String?,
      schedules: (json['schedules'] as List<dynamic>?)
          ?.map((e) => ScheduleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TripResponseToJson(TripResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'event_date': instance.eventDate,
      'image': instance.image,
      'schedules': instance.schedules,
    };

ScheduleResponse _$ScheduleResponseFromJson(Map<String, dynamic> json) =>
    ScheduleResponse(
      content: json['content'] as String?,
      timeStart: json['time_start'] as String?,
      time: json['time'] as String?,
      address: json['address'] as String?,
      note: json['note'] as String?,
      free: json['free'] as int?,
      shift: json['shift'] as int?,
      shiftName: json['shift_name'] as String?,
      groups: json['groups'] as String?,
    );

Map<String, dynamic> _$ScheduleResponseToJson(ScheduleResponse instance) =>
    <String, dynamic>{
      'content': instance.content,
      'time_start': instance.timeStart,
      'time': instance.time,
      'address': instance.address,
      'note': instance.note,
      'free': instance.free,
      'shift': instance.shift,
      'shift_name': instance.shiftName,
      'groups': instance.groups,
    };
