import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/agent_model.dart';

class AbilityCard extends StatelessWidget {
  const AbilityCard({super.key, required this.agentData, required this.number});

  final AgentData agentData;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.18,
        height: MediaQuery.of(context).size.height * 0.07,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.white)),
        child: CachedNetworkImage(
          imageUrl: agentData.abilities![number].displayIcon ?? '',
          errorWidget: (context, url, error) =>
          const Icon(Icons.error),
          fit: BoxFit.cover,
        ));
  }
}
