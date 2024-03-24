import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jotub_app/features/authentication/domain/entities/user_authentication_entity.dart';
import 'package:jotub_app/features/home/domain/entities/banner_entity.dart';
import 'package:jotub_app/features/home/domain/repositories/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<FetchListBannerEvent>(_fetchListBanner);
    on<FetchUserProfileEvent>(_fetchUserProfile);
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

  Future<void> _fetchUserProfile(FetchUserProfileEvent event, Emitter<HomeState> emit) async {
    emit(FetchUserProfileLoadingState());
    final result = await homeRepository.fetchUserProfile();
    result.fold(
      (l) => emit(FetchUserProfileFailState(message: l)),
      (r) => emit(FetchUserProfileSuccessState(userInfo: r)),
    );
  }
}
