import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/utils/extensions.dart';
import 'package:waddle_app/src/common/reusable_label_widget.dart';

class ScrollUsageGraph extends StatelessWidget {
  const ScrollUsageGraph({super.key});

  @override
  Widget build(BuildContext context) {
    var data = [0.0, 9.0, 1.5, 2.0, -5.0, 0.0, -0.5, -11.0, -0.5, 0.0, 0.0];

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50,
            child: Sparkline(
              data: data,
              lineWidth: 3.0,
              useCubicSmoothing: true,
              cubicSmoothingFactor: 0.2,
              lineColor: context.color.primary,
            ),
          ),
          _buildSteps(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSection(480, 'Calories', context),
              _buildSection(480, 'Calories', context),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildSteps(BuildContext context) {
    return Column(
      children: [
        Text('Screen Time'.hardcoded, style: context.txtTheme.headlineSmall),
        gapH4,
        ReusableLabelWidget(text: '1240 Minutes'.hardcoded),
      ],
    );
  }

  Column _buildSection(double value, String label, BuildContext context) {
    return Column(
      children: [
        Text('$value', style: context.txtTheme.titleLarge),
        Text(
          label,
          style: context.txtTheme.bodyMedium!
              .copyWith(color: context.color.onSurface.withOpacity(0.5)),
        ),
      ],
    );
  }
}
