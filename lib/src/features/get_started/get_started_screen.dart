import 'package:flutter/material.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/router/app_router.dart';
import 'package:waddle_app/src/utils/extensions.dart';
import 'package:waddle_app/src/utils/waddle_logo_getter.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.primary,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isLandscape = constraints.maxWidth > constraints.maxHeight;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (!isLandscape) const Spacer(),
                        waddleLogo(220, 220),
                        gapH32,
                        _buildHeadline(context),
                        gapH24,
                        _buildBodyText(context),
                        if (isLandscape) gapH16,
                        if (!isLandscape) const Spacer(),
                        _buildLetsGoButton(context),
                        if (isLandscape) gapH16,
                        if (!isLandscape) const Spacer(flex: 2),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Text _buildHeadline(BuildContext context) {
    return Text(
      context.loc.getStarted,
      style: context.txtTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w900,
        color: context.color.onPrimary,
      ),
    );
  }

  Text _buildBodyText(BuildContext context) {
    return Text(
      context.loc.getStartedBody,
      textAlign: TextAlign.center,
      style:
          context.txtTheme.bodyLarge!.copyWith(color: context.color.onPrimary),
    );
  }

  ElevatedButton _buildLetsGoButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.color.onPrimary,
        foregroundColor: context.color.primary,
      ),
      child: Text(context.loc.letsGo),
      onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
    );
  }
}
