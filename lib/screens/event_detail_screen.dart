import 'package:flutter/material.dart';

import '../widgets.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({super.key, required this.controller, required this.index});

  final dynamic controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverAppBar(context, controller, index),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.events[index].title,
                      style: const TextStyle(fontSize: 35),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ImageWithTitleAndSubtitle(
                      image: controller.events[index].organiserIcon,
                      title: controller.events[index].organiserName,
                      subTitle: "Organizer",
                      isImage: true,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ImageWithTitleAndSubtitle(
                      image: Icons.calendar_month_sharp,
                      title:
                          getDateMonthYear(controller.events[index].dateTime),
                      subTitle:
                          getDayAndSpan(controller.events[index].dateTime),
                      isImage: false,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ImageWithTitleAndSubtitle(
                      image: Icons.location_on,
                      title: controller.events[index].venueName,
                      subTitle:
                          '${controller.events[index].venueCity}, ${controller.events[index].venueCountry}',
                      isImage: false,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    const Text(
                      'About Event',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      controller.events[index].description,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff5669FF),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                child: const Row(children: [
                  Expanded(
                    child: Text(
                      'BOOK NOW',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 40, 64, 240),
                        child: Icon(Icons.arrow_right_alt_sharp)),
                  )
                ]),
              ))),
    );
  }
}
