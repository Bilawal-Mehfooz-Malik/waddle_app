import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class UsageGraph extends StatelessWidget {
  const UsageGraph({super.key});

  @override
  Widget build(BuildContext context) {
    var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

    return SizedBox(
      height: 50,
      child: Sparkline(
        data: data,
        lineWidth: 3.0,
        useCubicSmoothing: true,
        cubicSmoothingFactor: 0.2,
        lineColor: context.color.primary,
      ),
    );
  }
}
