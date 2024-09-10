import 'package:flutter/material.dart';

class AgentImageError extends StatelessWidget {
  const AgentImageError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_outlined,
            color: const Color(0xffFD4556),
            size: MediaQuery.of(context).size.aspectRatio * 300,
          ),
          const SizedBox(height: 10,),
          const Text('Image Not Found',style: TextStyle(fontSize: 22,color: Colors.white,fontFamily: 'Valorant'),)
        ],
      ),
    );
  }
}
