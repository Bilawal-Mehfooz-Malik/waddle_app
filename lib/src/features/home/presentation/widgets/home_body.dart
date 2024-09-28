import 'package:flutter/material.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/scroll_usage_graph.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/steps_usage_graph.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/date_section.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/time_section.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/segmented_section.dart';
import 'package:waddle_app/src/features/home/presentation/controllers/home_view_controller.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeView = ref.watch(homeViewProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        gapH16,
        const TimeSection(),
        gapH32,
        const SegmentedSection(),
        gapH32,
        const DateSection(),
        if (homeView == HomeView.steps) const StepsUsageGraph(),
        if (homeView == HomeView.scrolling) const ScrollUsageGraph(),
        gapH8,
      ],
    );
  }
}
