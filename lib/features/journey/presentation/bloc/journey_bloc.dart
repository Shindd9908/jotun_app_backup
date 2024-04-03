import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/features/journey/domain/entities/gift_entity.dart';
import 'package:jotub_app/features/journey/domain/repositories/journey_repository.dart';

part 'journey_event.dart';

part 'journey_state.dart';

class JourneyBloc extends Bloc<JourneyEvent, JourneyState> {
  JourneyBloc({required this.journeyRepository}) : super(JourneyInitial()) {
    on<FetchListAreaEvent>(_fetchListArea);
    on<FetchListAreaCompletedEvent>(_fetchListAreaCompleted);
    on<FetchAreaHasTripSameTimeWithNowEvent>(_fetchAreaHasTripSameTimeWithNow);
    on<CompleteAreaEvent>(_completeArea);
    on<FetchListGiftEvent>(_fetchListGift);
    on<ReceiveGiftEvent>(_receiveGift);
  }

  final JourneyRepository journeyRepository;

  Future<void> _fetchListArea(FetchListAreaEvent event, Emitter<JourneyState> emit) async {
    emit(FetchListAreaLoadingState());
    final result = await journeyRepository.fetchListArea();
    result.fold(
      (l) => emit(FetchListAreaFailState()),
      (r) => emit(FetchListAreaSuccessState(listArea: r)),
    );
  }

  Future<void> _fetchListAreaCompleted(FetchListAreaCompletedEvent event, Emitter<JourneyState> emit) async {
    emit(FetchListAreaCompletedLoadingState());
    final result = await journeyRepository.fetchListAreaCompleted();
    result.fold(
      (l) => emit(FetchListAreaCompletedFailState()),
      (r) => emit(FetchListAreaCompletedSuccessState(listAreaCompleted: r)),
    );
  }

  Future<void> _fetchAreaHasTripSameTimeWithNow(FetchAreaHasTripSameTimeWithNowEvent event, Emitter<JourneyState> emit) async {
    Duration durationMinCompareEventDateWithNow = const Duration(days: 365);
    AreaEntity? areaHasEventDateClosestNow;
    int? tripIndex;
    for (int i = 0; i < event.listAllArea.length; ++i) {
      DateTime eventDate = DateTime.parse(event.listAllArea[i].trip!.eventDate!);
      if (eventDate.isAtSameMomentAs(DateTime.now()) || (eventDate.isAfter(DateTime.now())) && eventDate.difference(DateTime.now()) < durationMinCompareEventDateWithNow) {
        durationMinCompareEventDateWithNow = eventDate.difference(DateTime.now());
        areaHasEventDateClosestNow = event.listAllArea[i];
        tripIndex = i + 1;
      }
    }
    emit(FetchAreaHasTripSameTimeWithNowState(area: areaHasEventDateClosestNow, tripIndex: tripIndex));
  }

  Future<void> _completeArea(CompleteAreaEvent event, Emitter<JourneyState> emit) async {
    emit(CompleteAreaLoadingState());
    final result = await journeyRepository.completeArea(event.areaId);
    result.fold(
      (l) => emit(CompleteAreaFailState(message: l)),
      (r) => emit(CompleteAreaSuccessState(message: r)),
    );
  }

  Future<void> _fetchListGift(FetchListGiftEvent event, Emitter<JourneyState> emit) async {
    emit(FetchListGiftLoadingState());
    final result = await journeyRepository.fetchListGift(event.type);
    result.fold(
      (l) => emit(FetchListGiftFailState(message: l)),
      (r) => emit(FetchListGiftSuccessState(listGift: r)),
    );
  }

  Future<void> _receiveGift(ReceiveGiftEvent event, Emitter<JourneyState> emit) async {
    emit(ReceiveGiftLoadingState());
    final result = await journeyRepository.receivedGift(event.giftId, event.type);
    result.fold(
      (l) => emit(ReceiveGiftFailState(message: l)),
      (r) => emit(ReceiveGiftSuccessState(message: r)),
    );
  }
}
