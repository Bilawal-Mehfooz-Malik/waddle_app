import 'package:flutter/material.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/utils/extensions.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

enum HomeView { steps, scrolling }

class CustomSegmentedButton extends StatefulWidget {
  const CustomSegmentedButton({super.key});

  @override
  State<CustomSegmentedButton> createState() => _CustomSegmentedButtonState();
}

class _CustomSegmentedButtonState extends State<CustomSegmentedButton> {
  HomeView _selectedSegment = HomeView.steps;

  void _onChanged(value) {
    if (value != null) {
      setState(() => _selectedSegment = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(25);

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
        onValueChanged: _onChanged,
        children: _buildChildrens(context),
      ),
    );
  }

  Map<HomeView, Widget> _buildChildrens(BuildContext context) {
    return {
      HomeView.steps: _segmentedWidget(
          context.loc.steps, _selectedSegment == HomeView.steps),
      HomeView.scrolling: _segmentedWidget(
          context.loc.scrolling, _selectedSegment == HomeView.scrolling),
    };
  }

  Widget _segmentedWidget(String text, bool isSelected) {
    final color =
        isSelected ? context.color.secondary : context.color.onSecondary;

    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: Sizes.p4, horizontal: Sizes.p12),
      child: Text(
        text,
        style: context.txtTheme.bodyLarge!
            .copyWith(fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
