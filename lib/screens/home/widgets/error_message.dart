import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Something Wrong Happen Try Again',
          style: TextStyle(color: Color(0xffFD4556), fontSize: 16,fontFamily: 'Valorant')),
    );
  }
}
