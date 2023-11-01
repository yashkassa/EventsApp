import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';
import '../controllers/search_screen_controller.dart';
import '../widgets.dart';

class Search extends StatelessWidget {
  Search({super.key, required this.homeController});

  final SearchScreenController controller = Get.put(SearchScreenController());
  final HomePageController homeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(false),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Type Event Name",
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff5669FF),
              ),
            ),
            onChanged: (value) {
              controller.getSearchedEvent(value);
            },
          ),
          Obx(
            () => Flexible(
              fit: FlexFit.tight,
              child: ListView.builder(
                itemCount: controller.events.isEmpty
                    ? homeController.events.length
                    : controller.events.length,
                itemBuilder: (context, index) => CardTemplate(
                  controller:
                      controller.events.isEmpty ? homeController : controller,
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
