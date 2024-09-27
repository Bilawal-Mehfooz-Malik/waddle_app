import 'package:flutter/material.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class TimeSection extends StatelessWidget {
  const TimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHourGlass(context),
        gapH8,
        Text(context.loc.unlocked, style: context.txtTheme.titleLarge),
        gapH4,
        _buildMinutesText(context),
      ],
    );
  }

  Container _buildHourGlass(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.color.secondary.withOpacity(0.2),
      ),
      child: const Icon(Icons.hourglass_top, size: 45),
    );
  }

  Text _buildMinutesText(BuildContext context) {
    // TODO: Implement minutes from realtime
    return Text(
      '40 ${context.loc.minutes}',
      style: context.txtTheme.bodyMedium!.copyWith(
        color: context.color.onSecondary.withOpacity(0.4),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
