import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main_provider.dart';
import 'widgets/tab_widget.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, required this.childWidget});

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      builder: (context, child) => Scaffold(
        backgroundColor: const Color(0xff0F1923),
        body: Consumer<MainProvider>(
          builder: (context, value, child) => Column(
            children: [
              Image.asset('assets/logo-icon.png'),
              const SizedBox(height: 8,),
              Image.asset('assets/logo-text.png'),
              const SizedBox(height: 10,),
              DefaultTabController(
                  length: 3,
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    onTap: value.setSource,
                    labelPadding: EdgeInsets.zero,
                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                    tabs: [
                      TabWidget("Agents", value.sourceIndex == 0),
                      TabWidget("Map", value.sourceIndex == 1),
                      TabWidget("Weapons", value.sourceIndex == 2)
                    ],
                  )),
              Expanded(child: childWidget),
            ],
          ),
        ),
      ),
    );
  }
}
