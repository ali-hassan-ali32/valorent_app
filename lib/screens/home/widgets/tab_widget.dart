import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final bool selected;
  final String title;
  const TabWidget(this.title , this.selected,{super.key});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: selected ? const Color(0xffFD4556) : Colors.transparent,
        ),
        child: Text(title,style: const TextStyle(fontSize: 25,fontFamily: 'Valorant'),),
      ),
    );
  }
}
