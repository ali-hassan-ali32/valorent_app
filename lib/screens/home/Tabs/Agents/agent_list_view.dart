import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:valorent_route/screens/home/widgets/agent_image_not_found.dart';

import '../../../../models/agent_model.dart';
import 'Widgets/agent_card.dart';

class AgentListView extends StatelessWidget {
  const AgentListView({
    super.key,
    required this.agents,
  });

  final List<AgentData> agents;

  @override
  Widget build(BuildContext context) {

    return CarouselSlider.builder(
      itemCount: agents.length,
      itemBuilder: (context, index, realIndex) {
        if(agents[index].fullPortraitV2 != null) {
          return AgentCard(agent: agents[index]);
        }

        return const AgentImageError();
      },

      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.6,
        enlargeCenterPage: true,
        autoPlay: true,

        enableInfiniteScroll: true,
      ),
    );
  }
}

