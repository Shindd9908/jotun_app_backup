import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:jotub_app/features/trip/presentation/ui/widgets/trip_detail_widget.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  final ScrollController _scrollController = ScrollController();

  final ValueNotifier _currentIndexTripLock = ValueNotifier<int>(-1);

  Timer? _timerCheckHourToUnlockTrip;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<JourneyBloc>().add(FetchListAreaEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    _timerCheckHourToUnlockTrip?.cancel();
    super.dispose();
  }

  void _checkTimeUnlockTrip(List<AreaEntity> listArea) {
    for (int i = 0; i < listArea.length; ++i) {
      if (listArea[i].trip != null && listArea[i].trip!.eventDate != null) {
        DateTime eventDate = DateTime.parse(listArea[i].trip!.eventDate!);
        if (eventDate.isBefore(DateTime.now()) || eventDate.isAtSameMomentAs(DateTime.now())) {
          continue;
        } else if (DateTime.now().difference(eventDate) == const Duration(days: 1) && DateTime.now().hour == 18) {
          _currentIndexTripLock.value = i;
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      isHasButtonBack: true,
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppHelper.setMultiDeviceSize(32, 32)),
          child: BlocConsumer<JourneyBloc, JourneyState>(
            listenWhen: (previous, current) => current is FetchListAreaSuccessState,
            listener: (context, state) {
              if (state is FetchListAreaSuccessState) {
                _timerCheckHourToUnlockTrip = Timer.periodic(const Duration(seconds: 1), (Timer t) => _checkTimeUnlockTrip(state.listArea));
              }
            },
            buildWhen: (previous, current) => current is FetchListAreaLoadingState || current is FetchListAreaSuccessState || current is FetchListAreaFailState,
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppHelper.setMultiDeviceSize(42, 42),
                      bottom: AppHelper.setMultiDeviceSize(12, 12),
                      left: AppHelper.setMultiDeviceSize(32, 32),
                      right: AppHelper.setMultiDeviceSize(32, 32),
                    ),
                    child: Image.asset(AppAssets.imgTitle),
                  ),
                  Expanded(
                    child: state is FetchListAreaSuccessState
                        ? state.listArea.isEmpty
                            ? Align(
                                alignment: Alignment.center,
                                child: TextWidget(
                                  text: S.of(context).noData,
                                  color: AppColor.colorMainWhite,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            : SingleChildScrollView(
                                controller: _scrollController,
                                child: Column(
                                  children: List.generate(
                                    state.listArea.length,
                                    (index) => ValueListenableBuilder(
                                      valueListenable: _currentIndexTripLock,
                                      builder: (_, __, ___) => TripDetailWidget(
                                        unlock: index < _currentIndexTripLock.value,
                                        trip: state.listArea[index].trip ?? const TripEntity(),
                                        tripIndex: index + 1,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                        : SpinKitLoadingWidget(
                            color: AppColor.colorMainWhite,
                            size: AppHelper.setMultiDeviceSize(36, 36),
                          ),
                  ),
                  if (state is FetchListAreaSuccessState && state.listArea.length >= 3)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: GestureDetector(
                        onTap: () async => await _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                        ),
                        child: SizedBox(
                          height: AppHelper.setMultiDeviceSize(24, 24),
                          child: Image.asset(AppAssets.iconArrowDown),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
