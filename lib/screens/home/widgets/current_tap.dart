import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorent_route/providers/main_provider.dart';
import 'package:valorent_route/screens/home/Tabs/Agents/agent_list_builder.dart';
import 'package:valorent_route/screens/home/Tabs/Maps/map_list_builder.dart';

import '../Tabs/Weapeons/weaponListBuilder.dart';

class CurrentTap extends StatelessWidget {
  const CurrentTap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<MainProvider, int>(
      selector: (p0, p1) => p1.sourceIndex,
      builder: (context, currentTapIndex, child) {
        switch(currentTapIndex) {
          case 0:
            return const AgentListBuilder();
          case 1:
            return const MapListBuilder();
          default:
            return const WeaponListBuilder();
        }
      },
    );
  }
}
