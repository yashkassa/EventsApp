import 'package:event_app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bookmark_controller.dart';

class BookMarkScreen extends StatelessWidget {
  BookMarkScreen({super.key});

  final BookmarkController controller = Get.put(BookmarkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(false, bookmarkScreen: true),
        body: ListView.builder(
          itemCount: BookmarkController.bookmarkEvents.length,
          itemBuilder: (context, index) => CardTemplate(
            controller: controller,
            index: index,
            bookmarkScreen: true,
          ),
        ));
  }
}
