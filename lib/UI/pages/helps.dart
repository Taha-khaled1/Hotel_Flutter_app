import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/UI/handlingView/handlingview.dart';
import 'package:hotelbooking/controller/hlelp_controller.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:quickalert/quickalert.dart';

import '../../my_widgets.dart';

class Helps extends StatefulWidget {
  const Helps({Key? key}) : super(key: key);

  @override
  State<Helps> createState() => _HelpsState();
}

class _HelpsState extends State<Helps> {
  TextEditingController _txtsearch = TextEditingController();

  HelpsController helpsController = Get.put(HelpsController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HelpController controller = Get.put(HelpController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(""),
        titleSpacing: -5,
      ),
      body: GetBuilder<HelpController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.blue,
                    child: Container(
                      width: Get.width,
                      padding:
                          const EdgeInsetsDirectional.only(start: 20, end: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "How can we help",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _txtsearch,
                            decoration: InputDecoration(
                              hintText: "{",
                              prefixIcon: IconButton(
                                onPressed: () async {},
                                icon: const Icon(Icons.search_outlined),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      itemBuilder: (context, int i) {
                        return Align(
                          alignment: Alignment.topRight,
                          child: ExpansionTile(
                            title: Text(
                              controller.helpModel?.topics?[i].topic ?? 'topic',
                              style:
                                  TextStyle(fontSize: 21, color: Colors.black),
                            ),
                            children: List.generate(
                              controller.helpModel?.topics?[i].helpQuestions!
                                      .length ??
                                  0,
                              (index) => Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 6,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.info,
                                          title: controller
                                              .helpModel
                                              ?.topics?[i]
                                              .helpQuestions![index]
                                              .question,
                                          text: controller.helpModel?.topics?[i]
                                              .helpQuestions![index].answer,
                                        );
                                      },
                                      child: Text(
                                        controller
                                                .helpModel
                                                ?.topics?[i]
                                                .helpQuestions![index]
                                                .question ??
                                            'Question',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.teal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, int i) {
                        return Divider(
                            color: Colors.grey[300],
                            height: 1,
                            thickness: 1,
                            endIndent: 0,
                            indent: 0);
                      },
                      itemCount: controller.helpModel?.topics?.length ?? 0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HelpsController extends GetxController {
  Future<List?>? getData() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        "id": "1",
        "name": "How do I cancel my rooms reservation? ",
        "desc": "A cross platform plugin for displaying local notifications.",
      },
      {
        "id": "2",
        "name": "What methods of payment does rooms accept? ",
        "desc":
            "Schedule a notification to be shown daily at a specified time.",
      },
      {
        "id": "3",
        "name": "When am I charged for a reservation? ",
        "desc":
            "Ability to handle when a user has tapped on a notification, when the app is in the foreground, background or is terminated.",
      },
    ];
  }
}
