import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../models/home_page_model.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    getAllEvents();
    super.onInit();
  }

  RxList events = [].obs;

  Future getAllEvents() async {
    var response = await http.get(Uri.parse(
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event'));
    print(response.body);

    puttingDataintoModel(response);
  }

  void puttingDataintoModel(response) {
    var convertedData = jsonDecode(response.body);
    for (var i in convertedData['content']['data']) {
      events.add(AllEventsModel.fromJson(i));
    }
  }

  // Future getEventDetails(int id) async {
  //   var response = await http.get(Uri.parse())
  // }
}
