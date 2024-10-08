import 'package:flutter/material.dart';
import 'package:valorent_route/screens/home/widgets/error_message.dart';

import '../../../../models/weapon_model.dart';
import '../../../../services/weapons_api.dart';
import 'weapon_card.dart';

class WeaponListBuilder extends StatefulWidget {
  const WeaponListBuilder({
    super.key,
  });
  @override
  State<WeaponListBuilder> createState() => _MapListBuilderState();
}

class _MapListBuilderState extends State<WeaponListBuilder> {
  late Future<List<WeaponData>> futureWeapons;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureWeapons = WeaponApi().getWeapons();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WeaponData>>(
      future: futureWeapons,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xffFD4556),
            ),
          );
        }

        List<WeaponData> weapons = snapshot.data ?? [];

        if(weapons.isEmpty) {
          return const ErrorMessage();
        }

        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: weapons.length,
          separatorBuilder: (context, index) => const SizedBox(height: 50,),
          itemBuilder: (context, index) {
            return WeaponCard(weapon: weapons[index],isRight: (index % 2 == 0));
          },
        );
      },
    );
  }
}
