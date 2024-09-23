import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  final double size;
  final Color color;

  const CustomLoading({
    super.key,
    this.size = 20.0,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitThreeBounce(color: color, size: size));
  }
}
