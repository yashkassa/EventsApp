import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';
import '../widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(true, controller: controller),
        body: GetX(
            init: HomePageController(),
            builder: (HomePageController) {
              return ListView.builder(
                itemCount: controller.events.length,
                itemBuilder: (context, index) => CardTemplate(
                  controller: controller,
                  index: index,
                ),
              );
            }));
  }
}
