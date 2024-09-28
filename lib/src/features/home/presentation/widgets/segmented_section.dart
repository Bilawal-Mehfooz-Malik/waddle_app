import 'package:flutter/material.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/utils/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:waddle_app/src/features/home/presentation/controllers/home_view_controller.dart';

enum HomeView { steps, scrolling }

class SegmentedSection extends ConsumerWidget {
  const SegmentedSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radius = BorderRadius.circular(25);
    final notifier = ref.read(homeViewProvider.notifier);

    return Center(
      child: CustomSlidingSegmentedControl(
        decoration: BoxDecoration(
          borderRadius: radius,
          color: context.color.secondary.withOpacity(0.5),
        ),
        thumbDecoration: BoxDecoration(
          borderRadius: radius,
          color: context.color.onPrimary,
        ),

        // [Main Widgets]
        onValueChanged: notifier.onChanged,
        children: _buildChildrens(context, ref),
      ),
    );
  }

  Map<HomeView, Widget> _buildChildrens(BuildContext context, WidgetRef ref) {
    final homeView = ref.watch(homeViewProvider);
    return {
      HomeView.steps: _segmentedWidget(
          context, context.loc.steps, homeView == HomeView.steps),
      HomeView.scrolling: _segmentedWidget(
          context, context.loc.scrolling, homeView == HomeView.scrolling),
    };
  }

  Padding _segmentedWidget(BuildContext context, String text, bool isSelected) {
    final color =
        isSelected ? context.color.secondary : context.color.onSecondary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
      child: Text(
        text,
        style: context.txtTheme.bodyLarge!
            .copyWith(fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
