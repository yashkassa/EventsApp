import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'controllers/bookmark_controller.dart';
import 'screens/bookmark_screen.dart';
import 'screens/event_detail_screen.dart';
import 'screens/search_screen.dart';

AppBar appBar(eventsScreen, {controller, bookmarkScreen = false}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Text(
      eventsScreen
          ? 'Events'
          : bookmarkScreen
              ? 'Bookmarks'
              : 'Search',
      style: const TextStyle(color: Colors.black, fontSize: 26),
    ),
    actions: eventsScreen
        ? [
            IconButton(
                iconSize: 30,
                onPressed: () => Get.to(() => Search(
                      homeController: controller,
                    )),
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            IconButton(
                iconSize: 30,
                onPressed: () => Get.to(() => BookMarkScreen()),
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ))
          ]
        : [],
  );
}

class CardTemplate extends StatelessWidget {
  const CardTemplate(
      {super.key,
      required this.controller,
      required this.index,
      this.bookmarkScreen = false});

  final dynamic controller;
  final int index;
  final bool bookmarkScreen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!bookmarkScreen) {
          Get.to(() => EventDetail(controller: controller, index: index));
        }
      },
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  bookmarkScreen
                      ? BookmarkController.bookmarkEvents[index].bannerImage
                      : controller.events[index].bannerImage,
                  height: 100,
                  width: 95,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bookmarkScreen
                          ? dateTimeConvertion(
                              BookmarkController.bookmarkEvents[index].dateTime)
                          : dateTimeConvertion(
                              controller.events[index].dateTime),
                      style: TextStyle(color: Colors.blue),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Text(
                      bookmarkScreen
                          ? BookmarkController.bookmarkEvents[index].title
                          : controller.events[index].title,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            bookmarkScreen
                                ? '${BookmarkController.bookmarkEvents[index].venueName}, ${BookmarkController.bookmarkEvents[index].venueCity}, ${BookmarkController.bookmarkEvents[index].venueCountry}'
                                : '${controller.events[index].venueName}, ${controller.events[index].venueCity}, ${controller.events[index].venueCountry}',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 11),
                            overflow: TextOverflow.clip,
                            softWrap: true,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//#################################################### Event Detail widgets #########################

SliverAppBar sliverAppBar(BuildContext context, controller, index) {
  return SliverAppBar(
    pinned: true,
    backgroundColor: Color(0xff5669FF),
    title: Text('Event Details', style: TextStyle(fontSize: 26)),
    actions: [
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white.withOpacity(0.2)),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(right: 15, top: 8, bottom: 8),
          child: InkWell(
              onTap: () => BookmarkController.bookmarkEvents
                  .add(controller.events[index]),
              child: Icon(Icons.bookmark)))
    ],
    expandedHeight: MediaQuery.of(context).size.height * 0.3,
    flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
      controller.events[index].bannerImage,
      fit: BoxFit.fill,
    )),
  );
}

class ImageWithTitleAndSubtitle extends StatelessWidget {
  const ImageWithTitleAndSubtitle(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.isImage});

  final dynamic image;
  final String title;
  final String subTitle;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isImage
              ? Image.network(
                  image,
                  height: 50,
                  width: 50,
                )
              : Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 225, 227, 247)),
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    image,
                    color: Color(0xff5669FF),
                    size: 30,
                  )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: isImage ? 15 : 16)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                subTitle,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}

String dateTimeConvertion(date) {
  String dayOfWeek = DateFormat('EEEE').format(date);
  String monthInWords = DateFormat('MMMM').format(date);
  int dayOfMonth = date.day;
  String time = DateFormat.jm().format(date);
  String result = '$dayOfWeek, $monthInWords $dayOfMonth, $time';
  return result;
}

String getDateMonthYear(date) {
  String formattedDate = DateFormat('d, MMMM yyyy').format(date);
  return formattedDate;
}

String getDayAndSpan(date) {
  String dayOfWeek = DateFormat('EEEE').format(date);
  String startTime = DateFormat('h:mm a').format(date);
  DateTime endTime = date.add(Duration(hours: 7));
  String endTimeFormatted = DateFormat('h:mm a').format(endTime);

  String formattedDate = '$dayOfWeek, $startTime - $endTimeFormatted';
  return formattedDate;
}
