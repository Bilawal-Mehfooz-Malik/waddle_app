import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

SizedBox waddleLogo(double height, double width) {
  const logoPath = 'assets/images/waddle_logo.svg';
  return SizedBox(
      height: height, width: width, child: SvgPicture.asset(logoPath));
}
