import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/features/home/presentation/controllers/home_view_controller.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/time_section.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/segmented_section.dart';
import 'package:waddle_app/src/utils/extensions.dart';

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
          if (homeView == HomeView.steps) const Expanded(child: Placeholder()),
          if (homeView == HomeView.scrolling)
            const Expanded(child: Placeholder()),
          gapH8,
        ],
      ),
    );
  }
}

class DateSection extends StatelessWidget {
  const DateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _leftSection(context),
        _rightDropdownButton(),
      ],
    );
  }

  Column _leftSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today'.hardcoded,
          style: context.txtTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: context.color.onSurface.withOpacity(0.5),
          ),
        ),
        Text(
          'Thu, 08 July'.hardcoded,
          style: context.txtTheme.headlineSmall,
        ),
      ],
    );
  }

  Widget _rightDropdownButton() {
    return Text('Today'.hardcoded);
  }
}
