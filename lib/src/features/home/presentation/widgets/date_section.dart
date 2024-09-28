import 'package:flutter/material.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/utils/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waddle_app/src/features/home/presentation/controllers/day_toggle_controller.dart';

class DateSection extends ConsumerWidget {
  const DateSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _leftSection(context),
          _rightDropdownButton(context, ref),
        ],
      ),
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

  Container _rightDropdownButton(BuildContext context, WidgetRef ref) {
    var value = ref.watch(dayToggleProvider);
    final notifier = ref.read(dayToggleProvider.notifier).onChanged;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p16),
        border: Border.all(color: context.color.onSurface.withOpacity(0.3)),
      ),
      child: DropdownButton(
        value: value,
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(Sizes.p16),
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
        items: [
          DropdownMenuItem(
              value: DaySelected.today, child: Text(context.loc.today)),
          DropdownMenuItem(
              value: DaySelected.weekly, child: Text(context.loc.weekly)),
          DropdownMenuItem(
              value: DaySelected.montly, child: Text(context.loc.montly)),
        ],
        onChanged: notifier,
      ),
    );
  }
}
