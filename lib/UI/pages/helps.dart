import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/UI/handlingView/handlingview.dart';
import 'package:hotelbooking/controller/hlelp_controller.dart';
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
                  Container(
                    alignment: Alignment.center,
                    width: 350,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: const Text(
                      "صفحة المساعده",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                        return ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12),
                          title: Text(controller.helpModel?.topics?[i].topic ??
                              'topic'),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black26,
                            size: 15.0,
                          ),
                          onTap: () async {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.info,
                              title: controller.helpModel?.topics?[i]
                                  .helpQuestions![0].question,
                              text: controller.helpModel?.topics?[i]
                                  .helpQuestions![0].answer,
                            );
                          },
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
