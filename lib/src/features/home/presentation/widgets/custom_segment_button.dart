import 'package:flutter/cupertino.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/utils/extensions.dart';

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
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: CupertinoSlidingSegmentedControl<HomeView>(
          backgroundColor: context.color.secondary.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p12,
            vertical: Sizes.p4,
          ),

          // [Main Widgets]
          groupValue: _selectedSegment,
          onValueChanged: _onChanged,
          children: _buildChildrens(context),
        ),
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

    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.p4, horizontal: Sizes.p8),
        child: Text(
          text,
          style: context.txtTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, color: color),
        ),
      ),
    );
  }
}
