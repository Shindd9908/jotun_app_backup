import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/new_products/presentation/bloc/new_products_bloc.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/cache_image_widget.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class NewProductsScreen extends StatefulWidget {
  const NewProductsScreen({super.key});

  @override
  State<NewProductsScreen> createState() => _NewProductsScreenState();
}

class _NewProductsScreenState extends State<NewProductsScreen> {
  final PageController _pageController = PageController();

  final ValueNotifier _currentIndexPage = ValueNotifier<int>(0);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewProductsBloc>().add(const FetchListNewProductsEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      isHasButtonBack: true,
      child: Expanded(
        child: BlocBuilder<NewProductsBloc, NewProductsState>(
          buildWhen: (previous, current) => current is FetchListNewProductsLoadingState || current is FetchListNewProductsSuccessState || current is FetchListNewProductsFailState,
          builder: (context, state) {
            return Column(
              children: [
                if (state is FetchListNewProductsSuccessState && state.listNewProduct.length > 1)
                  ValueListenableBuilder(
                    valueListenable: _currentIndexPage,
                    builder: (_, __, ___) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      child: GestureDetector(
                        onTap: () => _currentIndexPage.value >= 1
                            ? _pageController.animateToPage(
                                _pageController.page!.toInt() - 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                              )
                            : null,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: _currentIndexPage.value >= 1
                              ? Image.asset(
                                  AppAssets.iconArrowDown,
                                  width: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                  height: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                )
                              : SizedBox(
                                  width: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                  height: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: state is FetchListNewProductsSuccessState
                      ? state.listNewProduct.isNotEmpty
                          ? PageView(
                              controller: _pageController,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(
                                state.listNewProduct.length,
                                (index) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CacheImageWidget(
                                      imageUrl: state.listNewProduct[index].image,
                                      widthImage: AppHelper.setMultiDeviceSize(context, 744.w, 393.w) - AppHelper.setMultiDeviceSize(context, 744.w / 3, 64.w),
                                      fit: BoxFit.fitWidth,
                                      radius: 16,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: AppHelper.setMultiDeviceSize(context, 0, 48.w)),
                                      child: Column(
                                        children: [
                                          TextWidget(
                                            text: state.listNewProduct[index].productName,
                                            color: AppColor.colorMainWhite,
                                            fontSize: AppHelper.setMultiDeviceSize(context, 24.sp, 20.sp),
                                            fontWeight: FontWeight.w700,
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 16),
                                          SizedBox(
                                            width: AppHelper.setMultiDeviceSize(context, 744.w, 393.w) - AppHelper.setMultiDeviceSize(context, 84.w, 64.w),
                                            child: TextWidget(
                                              text: state.listNewProduct[index].description,
                                              color: AppColor.colorMainWhite,
                                              fontSize: AppHelper.setMultiDeviceSize(context, 18.sp, 12.sp),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onPageChanged: (index) => _currentIndexPage.value = index,
                            )
                          : Container(
                              alignment: Alignment.center,
                              child: TextWidget(
                                text: S.of(context).noData,
                                color: AppColor.colorMainWhite,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                      : SpinKitLoadingWidget(
                          color: AppColor.colorMainWhite,
                          size: AppHelper.setMultiDeviceSize(context, 40, 40),
                        ),
                ),
                if (state is FetchListNewProductsSuccessState && state.listNewProduct.length > 1)
                  ValueListenableBuilder(
                    valueListenable: _currentIndexPage,
                    builder: (_, __, ___) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      child: GestureDetector(
                        onTap: () => _currentIndexPage.value < state.listNewProduct.length - 1
                            ? _pageController.animateToPage(
                                _pageController.page!.toInt() + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                              )
                            : null,
                        child: _currentIndexPage.value < state.listNewProduct.length - 1
                            ? Image.asset(
                                AppAssets.iconArrowDown,
                                width: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                height: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                              )
                            : SizedBox(
                                width: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                                height: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                              ),
                      ),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
