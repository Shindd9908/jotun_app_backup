import "package:jotub_app/features/journey/data/models/area_response.dart";
import "package:jotub_app/features/journey/domain/entities/area_entity.dart";

extension AreaMapExt on AreaResponse {
  AreaEntity get areaEntity => AreaEntity(
        areaId: areaId,
        areaName: areaName,
        areaTitle: areaTitle,
        areaImage: areaImage,
        areaCode: areaCode,
        questions: questions!.map((e) => e.questionEntity).toList(),
        trips: trips!.map((e) => e.tripEntity).toList(),
      );
}

extension QuestionMapExt on QuestionResponse {
  QuestionEntity get questionEntity => QuestionEntity(
        title: title,
        answers: answers!.map((e) => e.answerEntity).toList(),
      );
}

extension AnswerMapExt on AnswerResponse {
  AnswerEntity get answerEntity => AnswerEntity(
        answer: answer,
        correct: correct,
      );
}

extension TripMapExt on TripResponse {
  TripEntity get tripEntity => TripEntity(
        name: name,
        title: title,
        eventDate: eventDate,
        image: image,
        schedules: schedules!.map((e) => e.scheduleEntity).toList(),
      );
}

extension ScheduleMapExt on ScheduleResponse {
  ScheduleEntity get scheduleEntity => ScheduleEntity(
        content: content,
        timeStart: timeStart,
        time: time,
        address: address,
        note: note,
        free: free,
        shift: shift,
        shiftName: shiftName,
        groups: groups,
      );
}
