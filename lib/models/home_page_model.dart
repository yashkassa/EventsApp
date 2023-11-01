// To parse this JSON data, do
//
//     final allEventsModel = allEventsModelFromJson(jsonString);

import 'dart:convert';

List<AllEventsModel> allEventsModelFromJson(String str) =>
    List<AllEventsModel>.from(
        json.decode(str).map((x) => AllEventsModel.fromJson(x)));

String allEventsModelToJson(List<AllEventsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllEventsModel {
  int id;
  String title;
  String description;
  String bannerImage;
  DateTime dateTime;
  String organiserName;
  String organiserIcon;
  String venueName;
  String venueCity;
  String venueCountry;

  AllEventsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.bannerImage,
    required this.dateTime,
    required this.organiserName,
    required this.organiserIcon,
    required this.venueName,
    required this.venueCity,
    required this.venueCountry,
  });

  factory AllEventsModel.fromJson(Map<String, dynamic> json) => AllEventsModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        bannerImage: json["banner_image"],
        dateTime: DateTime.parse(json["date_time"]),
        organiserName: json["organiser_name"],
        organiserIcon: json["organiser_icon"],
        venueName: json["venue_name"],
        venueCity: json["venue_city"],
        venueCountry: json["venue_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "banner_image": bannerImage,
        "date_time": dateTime.toIso8601String(),
        "organiser_name": organiserName,
        "organiser_icon": organiserIcon,
        "venue_name": venueName,
        "venue_city": venueCity,
        "venue_country": venueCountry,
      };
}
