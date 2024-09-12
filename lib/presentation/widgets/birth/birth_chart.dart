import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BirthChart extends StatelessWidget {
  final String svgData;

  const BirthChart({Key? key, required this.svgData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      svgData,
      placeholderBuilder: (BuildContext context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}