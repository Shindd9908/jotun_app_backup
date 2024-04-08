import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:jotub_app/features/home/presentation/ui/widgets/content_popup_yet_event_time_widget.dart';
import 'package:jotub_app/features/home/presentation/ui/widgets/feature_item.dart';
import 'package:jotub_app/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/constants/constants.dart';
import 'package:jotub_app/utils/global_widgets/cache_image_widget.dart';
import 'package:jotub_app/utils/global_widgets/popup_dialog_alert.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const FetchListBannerEvent());
      context.read<HomeBloc>().add(const FetchUserProfileEvent());
      context.read<JourneyBloc>().add(FetchListAreaEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppHelper.setMultiDeviceSize(context, 24.h, 24.h),
                horizontal: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) => current is FetchUserProfileLoadingState || current is FetchUserProfileSuccessState || current is FetchUserProfileFailState,
                    builder: (context, state) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                              AppPaths.profileScreen,
                              arguments: {'userInfo': state is FetchUserProfileSuccessState ? state.userInfo : null},
                            ),
                            child: state is FetchUserProfileSuccessState && state.userInfo.avatar != null && state.userInfo.avatar!.isNotEmpty
                                ? CacheImageWidget(
                                    imageUrl: state.userInfo.avatar,
                                    widthImage: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                    heightImage: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                    radius: 100,
                                  )
                                : Image.asset(
                                    AppAssets.iconAvatar,
                                    width: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                    height: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                  ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pushNamed(
                                    AppPaths.profileScreen,
                                    arguments: {'userInfo': state is FetchUserProfileSuccessState ? state.userInfo : null},
                                  ),
                                  child: TextWidget(
                                    text: state is FetchUserProfileSuccessState ? state.userInfo.name : '',
                                    color: AppColor.colorMainWhite,
                                    fontSize: AppHelper.setMultiDeviceSize(context, 22.sp, 14.sp),
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                ),
                                SizedBox(height: AppHelper.setMultiDeviceSize(context, 8.h, 4.h)),
                                TextWidget(
                                  text: '${S.of(context).group} ${state is FetchUserProfileSuccessState ? state.userInfo.groupId.toString() : ''}',
                                  color: AppColor.colorMainYellow,
                                  fontSize: AppHelper.setMultiDeviceSize(context, 16.sp, 12.sp),
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(AppPaths.listNotificationScreen),
                    child: Image.asset(
                      AppAssets.iconNotification,
                      width: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                      height: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) => current is FetchListBannerSuccessState || current is FetchListBannerFailState || current is FetchListBannerLoadingState,
              builder: (context, state) {
                return state is FetchListBannerLoadingState
                    ? SizedBox(
                        width: AppHelper.setMultiDeviceSize(context, 744.w, 393.w) - 32.w,
                        height: AppHelper.setMultiDeviceSize(context, 1133.h * 20 / 100, 852.h * 1 / 5),
                        child: SpinKitLoadingWidget(color: AppColor.colorMainWhite, size: 36.sp),
                      )
                    : state is FetchListBannerSuccessState && state.listBanner.isNotEmpty
                        ? CarouselSlider(
                            options: CarouselOptions(
                              height: AppHelper.setMultiDeviceSize(context, 1133.h * 20 / 100, 852.h * 1 / 5),
                              viewportFraction: 1,
                              autoPlay: true,
                            ),
                            items: state.listBanner
                                .map(
                                  (el) => CacheImageWidget(
                                    imageUrl: el.bannerURL,
                                    widthImage: AppHelper.setMultiDeviceSize(context, 744.w, 393.w) - AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                    heightImage: AppHelper.setMultiDeviceSize(context, 1133.h * 20 / 100, 852.h * 1 / 5),
                                    fit: BoxFit.fitWidth,
                                    radius: AppHelper.setMultiDeviceSize(context, 22, 8),
                                  ),
                                )
                                .toList(),
                          )
                        : Image.asset(
                            AppAssets.imgBanner,
                            width: AppHelper.setMultiDeviceSize(context, 744.w, 393.w) - AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                            height: AppHelper.setMultiDeviceSize(context, 1133.h * 16 / 100, 852.h * 1 / 5),
                          );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppHelper.setMultiDeviceSize(context, 48.w, 32.w)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 22.h, bottom: 12.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextWidget(
                        text: S.of(context).incomingEvent,
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(context, 24.sp, 18.sp),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  BlocConsumer<JourneyBloc, JourneyState>(
                    listenWhen: (previous, current) => current is FetchListAreaSuccessState,
                    listener: (context, state) {
                      if (state is FetchListAreaSuccessState && state.listArea.isNotEmpty) {
                        context.read<JourneyBloc>().add(FetchAreaHasTripSameTimeWithNowEvent(listAllArea: state.listArea));
                      }
                    },
                    buildWhen: (previous, current) => current is FetchListAreaFailState || current is FetchAreaHasTripSameTimeWithNowState,
                    builder: (context, state) {
                      return state is FetchAreaHasTripSameTimeWithNowState
                          ? Container(
                              decoration: BoxDecoration(
                                image: (state.area?.trip?.image != null)
                                    ? DecorationImage(
                                        image: NetworkImage(state.area!.trip!.image!),
                                        fit: BoxFit.cover,
                                        opacity: 0.1,
                                      )
                                    : const DecorationImage(
                                        image: ExactAssetImage(AppAssets.imgLogoApp),
                                        fit: BoxFit.contain,
                                        opacity: 0.1,
                                      ),
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(width: 2, color: AppColor.colorMainWhite),
                              ),
                              child: state.area != null
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                            right: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                            top: AppHelper.setMultiDeviceSize(context, 28.h, 20.h),
                                          ),
                                          child: TextWidget(
                                            text: state.area?.trip?.title ?? '',
                                            color: AppColor.colorMainYellow,
                                            fontSize: AppHelper.setMultiDeviceSize(context, 28.sp, 18.sp),
                                            fontWeight: FontWeight.w900,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        if (state.area?.trip?.schedules != null && state.area!.trip!.schedules!.isNotEmpty)
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: AppHelper.setMultiDeviceSize(context, 28.h, 20.h),
                                              horizontal: AppHelper.setMultiDeviceSize(context, 24.w, 16.w),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      AppAssets.iconCalendar,
                                                      width: AppHelper.setMultiDeviceSize(context, 40.w, 24.w),
                                                      height: AppHelper.setMultiDeviceSize(context, 40.w, 24.w),
                                                    ),
                                                    TextWidget(
                                                      text: state.area?.trip?.schedules?.first.timeStart ?? '',
                                                      color: AppColor.colorMainWhite,
                                                      fontSize: AppHelper.setMultiDeviceSize(context, 22.sp, 14.sp),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: AppHelper.setMultiDeviceSize(context, 24.w, 16.w)),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      AppAssets.iconGlobal,
                                                      width: AppHelper.setMultiDeviceSize(context, 40.w, 24.w),
                                                      height: AppHelper.setMultiDeviceSize(context, 40.w, 24.w),
                                                    ),
                                                    TextWidget(
                                                      text: state.area?.trip?.schedules?.first.address ?? '',
                                                      color: AppColor.colorMainWhite,
                                                      fontSize: AppHelper.setMultiDeviceSize(context, 22.sp, 14.sp),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                          padding: EdgeInsets.only(top: state.area?.trip?.schedules != null && state.area!.trip!.schedules!.isNotEmpty ? 0 : 20),
                                          child: TextWidget(
                                            text: 'Yêu cầu sự kiện: Lễ phục, trang phục dự tiệc',
                                            color: AppColor.colorMainWhite,
                                            fontSize: AppHelper.setMultiDeviceSize(context, 22.sp, 14.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: AppHelper.setMultiDeviceSize(context, 28.h, 20.h),
                                              right: AppHelper.setMultiDeviceSize(context, 6.w, 4.w),
                                              bottom: AppHelper.setMultiDeviceSize(context, 4.w, 2.w),
                                            ),
                                            child: GestureDetector(
                                              onTap: () => Navigator.of(context).pushNamed(
                                                AppPaths.scheduleScreen,
                                                arguments: {'trip': state.area!.trip, 'tripIndex': state.tripIndex},
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextWidget(
                                                    text: S.of(context).goToDetailTrip,
                                                    color: AppColor.colorMainYellow,
                                                    fontSize: AppHelper.setMultiDeviceSize(context, 18.sp, 12.sp),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: AppColor.colorMainYellow,
                                                    size: AppHelper.setMultiDeviceSize(context, 16.w, 10.w),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      height: AppHelper.setMultiDeviceSize(
                                        context,
                                        AppHelper.setMultiDeviceSize(context, 150.h, 120.h),
                                        AppHelper.setMultiDeviceSize(context, 150.h, 120.h),
                                      ),
                                      child: TextWidget(
                                        text: AppHelper.isCurrentDateInRange() ? S.of(context).eventStartedTitle : S.of(context).noData,
                                        color: AppColor.colorMainWhite,
                                        fontSize: AppHelper.setMultiDeviceSize(context, 24.sp, 14.sp),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            )
                          : state is FetchListAreaFailState
                              ? Container(
                                  alignment: Alignment.center,
                                  height: AppHelper.setMultiDeviceSize(
                                    context,
                                    AppHelper.setMultiDeviceSize(context, 150.h, 120.h),
                                    AppHelper.setMultiDeviceSize(context, 150.h, 120.h),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColor.colorMainBlack,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(width: 2, color: AppColor.colorMainWhite),
                                  ),
                                  child: TextWidget(
                                    text: S.of(context).noData,
                                    color: AppColor.colorMainWhite,
                                    fontSize: AppHelper.setMultiDeviceSize(context, 24.sp, 14.sp),
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              : SpinKitLoadingWidget(color: AppColor.colorMainWhite, size: AppHelper.setMultiDeviceSize(context, 36.sp, 36.sp));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppHelper.setMultiDeviceSize(context, 22.h, 12.h),
                      bottom: AppHelper.setMultiDeviceSize(context, 20.h, 16.h),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextWidget(
                        text: S.of(context).feature,
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(context, 24.sp, 18.sp),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    runSpacing: AppHelper.setMultiDeviceSize(context, 32.h, 24.h),
                    spacing: AppHelper.setMultiDeviceSize(context, 34.w, 12.w),
                    children: Constants.getListFeatureHomePage(context)
                        .map(
                          (el) => SizedBox(
                            width: (AppHelper.setMultiDeviceSize(context, 744.w, 393.w)) / 4,
                            child: GestureDetector(
                              onTap: () => (el['featureName'] == S.of(context).newProductInformation || el['featureName'] == S.of(context).preorder || el['featureName'] == S.of(context).promotions) &&
                                      DateTime.now().isBefore(DateTime.parse('2024-05-08 18:00:00'))
                                  ? PopupDialogAlert.showPopupWithUIParamHasBell(context, const ContentPopupYetEventTimeWidget())
                                  : Navigator.of(context).pushNamed(el['pathScreenNavigateOnTap']),
                              child: FeatureItem(
                                title: el['featureName'],
                                iconAsset: el['pathIcon'],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
