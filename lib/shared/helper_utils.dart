import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

Widget getSVGImage(String assetName) {
  final Widget companyLogo = SvgPicture.asset(assetName);
  return companyLogo;
}