import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/onboarding_theme.dart';
import '../models/onboarding_page_model.dart';
import '../viewmodels/onboarding_view_model.dart';
import '../widgets/warm_ambient_background.dart';
import '../widgets/animated_page_indicator.dart';
import '../widgets/onboarding_cta_button.dart';
import '../widgets/tracking_illustration.dart';
import '../widgets/qr_illustration.dart';
import '../widgets/notification_illustration.dart';
import '../widgets/connected_transport_illustration.dart';

class OnboardingView extends GetView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Obx(() {
        final pageIndex = controller.currentPageIndex.value;
        final currentGradient = OnboardingColors.pageGradients[pageIndex];

        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(gradient: currentGradient),
          child: WarmAmbientBackground(
            child: SafeArea(
              child: Column(
                children: [
                  // Top Header Bar with Skip Button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.06,
                      vertical: size.height * 0.015,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Brand Badge
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: OnboardingColors.warmGold.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.directions_bus_rounded,
                                color: OnboardingColors.warmGold,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'SAFEVAN',
                              style: TextStyle(
                                color: OnboardingColors.offWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: (size.width * 0.04).clamp(14.0, 17.0),
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),

                        // Skip Button (Hidden on last page)
                        AnimatedOpacity(
                          opacity: controller.isLastPage ? 0.0 : 1.0,
                          duration: const Duration(milliseconds: 300),
                          child: TextButton(
                            onPressed: controller.isLastPage
                                ? null
                                : () => controller.skip(),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                color: OnboardingColors.softBeige.withOpacity(0.8),
                                fontSize: (size.width * 0.038).clamp(13.0, 15.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // PageView Body
                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.onPageChanged,
                      itemCount: OnboardingPageModel.pages.length,
                      itemBuilder: (context, index) {
                        final item = OnboardingPageModel.pages[index];
                        return _buildOnboardingPage(context, item);
                      },
                    ),
                  ),

                  // Bottom Navigation Controls
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.06,
                      vertical: size.height * 0.025,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Page Indicator
                        AnimatedPageIndicator(
                          count: OnboardingPageModel.pages.length,
                          currentIndex: pageIndex,
                        ),

                        // CTA Button (NEXT -> / GET STARTED ->)
                        OnboardingCtaButton(
                          isLastPage: controller.isLastPage,
                          onPressed: () => controller.nextPage(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildOnboardingPage(BuildContext context, OnboardingPageModel item) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Native Animated Hero Illustration
          Expanded(
            flex: 6,
            child: Center(
              child: _buildHeroIllustration(item.type),
            ),
          ),

          // Content Title & Description
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.02),
                Text(
                  item.title,
                  style: OnboardingTextStyles.heading(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.015),
                Text(
                  item.description,
                  style: OnboardingTextStyles.description(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroIllustration(OnboardingType type) {
    switch (type) {
      case OnboardingType.tracking:
        return const TrackingIllustration();
      case OnboardingType.qrSafety:
        return const QrIllustration();
      case OnboardingType.notifications:
        return const NotificationIllustration();
      case OnboardingType.connectedTransport:
        return const ConnectedTransportIllustration();
    }
  }
}
