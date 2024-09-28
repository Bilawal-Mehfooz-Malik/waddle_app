import 'package:flutter/material.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/usage_graph.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/date_section.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/time_section.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/segmented_section.dart';
import 'package:waddle_app/src/features/home/presentation/controllers/home_view_controller.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeView = ref.watch(homeViewProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TimeSection(),
          gapH24,
          const SegmentedSection(),
          gapH24,
          const DateSection(),
          gapH12,
          if (homeView == HomeView.steps) const UsageGraph(),
          if (homeView == HomeView.scrolling) const UsageGraph(),
          gapH8,
        ],
      ),
    );
  }
}
