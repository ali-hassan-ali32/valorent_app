import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/agent_model.dart';
import 'Widgets/ability_card.dart';

class AgentDetails extends StatelessWidget {
  const AgentDetails({super.key, required this.agentData});

  final AgentData agentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F1923),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          agentData.displayName!,
          style: const TextStyle(fontSize: 24, fontFamily: 'Valorant'),
          overflow: TextOverflow.ellipsis, // Handles text overflow
        ),
        actions: [
          Image.network(
            agentData.role?.displayIcon ?? '',
            width: 30,
            height: 40,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 12,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CachedNetworkImage(
                  imageUrl: agentData.background ?? '',
                  width: double.infinity,
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 25,
                  right: -50,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: CachedNetworkImage(
                      imageUrl: agentData.fullPortraitV2 ?? '',
                      placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Valorant'),
                ),
                const SizedBox(height: 6),
                Text(
                  agentData.description ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Valorant'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ability',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Valorant'),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                AbilityCard(agentData: agentData, number: 0),
                const SizedBox(width: 10),
                AbilityCard(agentData: agentData, number: 1),
                const SizedBox(width: 10),
                AbilityCard(agentData: agentData, number: 2),
                const SizedBox(width: 10),
                AbilityCard(agentData: agentData, number: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
