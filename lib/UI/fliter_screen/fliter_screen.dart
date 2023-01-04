import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/UI/B1_Home/Hotel/HotelList.dart';
import 'package:hotelbooking/UI/handlingView/handlingview.dart';
import 'package:hotelbooking/controller/filtter_controller.dart';
import 'package:hotelbooking/models/models_type.dart';
import 'package:lottie/lottie.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FiltterController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: controller.count == 0
                ? Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: 350,
                      height: 450,
                      child: Lottie.asset(
                          'assets/images/106964-shake-a-empty-box.json'),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 95.0),
                        child: Container(
                          color: Colors.white,
                          child: cardGrid(
                            message: controller.helpModel?.message!,
                          ),
                        ),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class cardGrid extends StatelessWidget {
  const cardGrid({Key? key, this.message}) : super(key: key);
  final List<MessageTowHouse>? message;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
      childAspectRatio: mediaQueryData.size.height / 1100,
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 0.0,
      primary: false,
      children: List.generate(
        /// Get data in flashSaleItem.dart (ListItem folder)
        message?.length ?? 0,
        (index) => itemGrid(message![index], 'منزل'),
      ),
    );
  }
}
