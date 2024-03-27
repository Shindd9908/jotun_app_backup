import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/features/journey/domain/repositories/journey_repository.dart';

part 'journey_event.dart';

part 'journey_state.dart';

class JourneyBloc extends Bloc<JourneyEvent, JourneyState> {
  JourneyBloc({required this.journeyRepository}) : super(JourneyInitial()) {
    on<FetchListAreaEvent>(_fetchListArea);
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
}
