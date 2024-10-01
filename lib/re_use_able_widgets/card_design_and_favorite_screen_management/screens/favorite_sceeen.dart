// Favorites Screen to show favorite items as full cards
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../card_controller.dart';
import '../widgets/favorite_card_widgets.dart';

class FavoritesScreen extends StatelessWidget {
  final controller = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.favoriteItems.length,
          itemBuilder: (context, index) {
            final cardIndex = controller.favoriteItems[index];
            return FavoriteCardItem(index: cardIndex); // Display favorite card with different style
          },
        );
      }),
    );
  }
}