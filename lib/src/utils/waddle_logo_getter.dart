import 'package:flutter_svg/svg.dart';

SvgPicture waddleLogo(double height, double width) {
  const logoPath = 'assets/images/waddle_logo.svg';
  return SvgPicture.asset(logoPath, height: height, width: width);
}
