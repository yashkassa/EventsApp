import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/home_page_model.dart';

class SearchScreenController extends GetxController {
  RxList events = [].obs;

  Future getSearchedEvent(keyword) async {
    var response = await http.get(Uri.parse(
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=${keyword}'));
    print(response.body);
    puttingDataintoModel(response);
  }

  void puttingDataintoModel(response) {
    var convertedData = jsonDecode(response.body);
    events.value = [];
    for (var i in convertedData['content']['data']) {
      events.add(AllEventsModel.fromJson(i));
    }
  }
}
