import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorent_route/screens/agnet_details/agent_details.dart';

import '../../../../../models/agent_model.dart';
import '../../../home_page.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({
    super.key,
    required this.agent,
  });

  final AgentData agent;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AgentDetails(agentData: agent),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: hexToColorList(agent.backgroundGradientColors ?? []),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(72),
            topRight: Radius.circular(24),
            bottomLeft: Radius.zero,
            bottomRight: Radius.circular(80),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 10,
              left: -90,
              child: SizedBox(
                width: 500,
                height: size.height * 0.7,
                child: CachedNetworkImage(
                  imageUrl: agent.fullPortraitV2 ?? '',
                  placeholder: (context, url) =>
                      Image.asset('assets/logo-icon.png'), // Placeholder
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error), // Error widget
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Text(
                agent.displayName ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Valorant'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
