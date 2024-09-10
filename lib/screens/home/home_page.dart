import 'package:flutter/material.dart';

import 'custom_backGround.dart';
import 'widgets/current_tap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return const CustomBackground(
      childWidget: CurrentTap(),
    );
  }
}



List<Color> hexToColorList(List<String> hexStrings) {
  return hexStrings.map((hexString) {
    return Color(int.parse(hexString, radix: 16));
  }).toList();
}

