import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jotub_app/features/home/domain/entities/banner_entity.dart';
import 'package:jotub_app/features/home/domain/repositories/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<FetchListBannerEvent>(_fetchListBanner);
  }

  final HomeRepository homeRepository;

  Future<void> _fetchListBanner(FetchListBannerEvent event, Emitter<HomeState> emit) async {
    emit(FetchListBannerLoadingState());
    final result = await homeRepository.fetchListBanner();
    result.fold(
      (l) => emit(FetchListBannerFailState(message: l)),
      (r) => emit(FetchListBannerSuccessState(listBanner: r)),
    );
  }
}
