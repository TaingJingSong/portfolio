import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/view/mainscreen/mainscreen_controller.dart';
import 'package:portfolio/widget/app_bar.dart';
import 'package:portfolio/widget/app_bottom.dart';
import 'package:portfolio/widget/backdrop_menu_widget.dart';
import 'package:portfolio/widget/boxline_widget.dart';
import 'package:portfolio/widget/dotbox_widget.dart';
import 'package:portfolio/widget/project_widget.dart';

class WorkScreen extends GetView<MainScreenController> {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MouseRegion(
        onHover: (event) {
          controller.top.value = event.position.dy;
          controller.left.value = event.position.dx;
        },
        onEnter: (event) {
          controller.isEnter.value = true;
        },
        onExit: (event) {
          controller.isEnter.value = false;
        },
        child: Stack(
          children: [
            Obx(() {
              return Visibility(
                visible: controller.isEnter.value,
                child: AnimatedPositioned(
                  duration: const Duration(milliseconds: 100),
                  top: controller.top.value - 25,
                  left: controller.left.value - 25,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.blueAccent.withAlpha(150),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            Scaffold(
              // backgroundColor: Theme.of(context).colorScheme.surface,
              backgroundColor: Colors.transparent,
              body: CustomScrollView(
                slivers: [
                  AppBarWidget(),
                  if (Responsive.isMobile(context))
                    SliverToBoxAdapter(child: BackDropMenuWidget()),
                  SliverList.list(
                    children: [
                      _buildBanner(context),
                      _buildCompletedProjectsSection(context),
                      _buildOnGoingProjectsSection(context),
                      Divider(
                        color: Theme.of(context).colorScheme.tertiary,
                        height: 50,
                      ),
                      BottomApp(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(context) {
    return FractionallySizedBox(
      widthFactor: Responsive.isMobile(context) ? 0.9 : 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: '/',
              style: TextStyle(
                fontFamily: 'EnglishFont',
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
              children: [
                TextSpan(
                  text: 'projects'.tr,
                  style: TextStyle(
                    fontFamily:
                        Get.locale == Locale('km')
                            ? 'KhmerFont'
                            : 'EnglishFont',
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'List of my projects'.tr,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.secondary,
              fontFamily:
                  Get.locale == Locale('km') ? 'KhmerFontDesc' : 'EnglishFont',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedProjectsSection(context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          right: -30,
          child: BoxLineWidget(width: 100, height: 100),
        ),
        Positioned(
          top: 50,
          left: -50,
          child: DotBoxWidget(width: 90, height: 90),
        ),
        Align(
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: Responsive.isMobile(context) ? 0.9 : 0.7,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '#',
                        style: TextStyle(
                          fontFamily: 'EnglishFont',
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        children: [
                          TextSpan(
                            text: 'completed-projects'.tr,
                            style: TextStyle(
                              fontFamily:
                                  Get.locale == Locale('km')
                                      ? 'KhmerFont'
                                      : 'EnglishFont',
                              fontSize: 24,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Divider(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
                const SizedBox(height: 30),
                MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        Responsive.isWindow(context)
                            ? 4
                            : Responsive.isTablet(context)
                            ? 3
                            : 2,
                  ),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.completedProjects.length,
                  itemBuilder:
                      (context, index) => ProjectWidget(
                        project: controller.completedProjects[index],
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOnGoingProjectsSection(context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          right: -30,
          child: BoxLineWidget(width: 100, height: 100),
        ),
        Positioned(
          top: 50,
          left: -50,
          child: DotBoxWidget(width: 90, height: 90),
        ),
        Align(
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: Responsive.isMobile(context) ? 0.9 : 0.7,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '#',
                        style: TextStyle(
                          fontFamily: 'EnglishFont',
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        children: [
                          TextSpan(
                            text: 'on-going'.tr,
                            style: TextStyle(
                              fontFamily:
                                  Get.locale == Locale('km')
                                      ? 'KhmerFont'
                                      : 'EnglishFont',
                              fontSize: 24,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Divider(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
                const SizedBox(height: 30),
                MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        Responsive.isWindow(context)
                            ? 4
                            : Responsive.isTablet(context)
                            ? 3
                            : 2,
                  ),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.onGoingProjects.length,
                  itemBuilder:
                      (context, index) => ProjectWidget(
                        project: controller.onGoingProjects[index],
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
