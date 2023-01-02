import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hotelbooking/UI/fliter_screen/fliter_screen.dart';
import 'package:hotelbooking/UI/handlingView/handlingview.dart';
import 'package:hotelbooking/controller/edit_profile_controller.dart';
import 'package:hotelbooking/controller/filtter_controller.dart';
import 'package:hotelbooking/models/cities_model.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var sliderValue = 1.0;
  SfRangeValues _values = const SfRangeValues(100, 600);
  bool q = false,
      w = false,
      e = false,
      r = false,
      t = false,
      y = false,
      u = false,
      i = false,
      o = false;
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffafafa),
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: Icon(
            Icons.clear,
            color: Colors.grey[800],
          ),
        ),
        title: const Text(""),
      ),
      body: GetBuilder<FiltterController>(
        init: FiltterController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Filter",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("price (for 1 night)",
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 40),
                        SfRangeSliderTheme(
                          data: SfRangeSliderThemeData(
                            tooltipBackgroundColor: Colors.transparent,
                            tooltipTextStyle: const TextStyle(
                              color: Colors.black,
                              height: 0,
                            ),
                          ),
                          child: SfRangeSlider(
                            min: 100,
                            max: 1000.0,
                            labelPlacement: LabelPlacement.betweenTicks,
                            edgeLabelPlacement: EdgeLabelPlacement.auto,
                            shouldAlwaysShowTooltip: true,
                            tooltipShape: const SfPaddleTooltipShape(),
                            tooltipTextFormatterCallback:
                                (dynamic actualValue, String formattedText) {
                              return "${double.parse(actualValue.toString()).round()}\$";
                            },
                            values: _values,
                            interval: 20.0,
                            // showTicks: true,
                            // showLabels: true,
                            stepSize: 1,
                            minorTicksPerInterval: 1,
                            onChanged: (SfRangeValues values) {
                              setState(() {
                                _values = values;
                                controller.maxprice = int.parse(
                                    values.end.toString().substring(0, 3));

                                controller.minprice = int.parse(
                                    values.start.toString().substring(0, 3));
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<FiltterController>(
                    builder: (controller) {
                      return HandlingDataView(
                        statusRequest: controller.statusRequest2,
                        widget: SizedBox(
                            width: 450,
                            height: 55,
                            child: DropdownButton<String>(
                              hint: Text('يرجي اختيار مدينه'),
                              value: controller.city,
                              items: controller.getCitesModel?.message!
                                  .map((Message value) {
                                return DropdownMenuItem<String>(
                                  value: value.name,
                                  child: Text(value.name ?? 'name'),
                                );
                              }).toList(),
                              onChanged: (vlue) {
                                setState(() {
                                  controller.city = vlue!;
                                });
                              },
                            )),
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "popular",
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: q,
                                title: const Text("free breakfast"),
                                onChanged: (val) {
                                  setState(() {
                                    q = val!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: w,
                                title: const Text("free barking"),
                                onChanged: (val) {
                                  setState(() {
                                    w = val!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: e,
                                title: const Text("pool"),
                                onChanged: (val) {
                                  setState(() {
                                    e = val!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: r,
                                title: const Text("pet friendly"),
                                onChanged: (val) {
                                  setState(() {
                                    r = val!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: y,
                                title: const Text("free wifi"),
                                onChanged: (val) {
                                  setState(() {
                                    y = val!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Distance from city center",
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 40),
                        SfSliderTheme(
                          data: SfSliderThemeData(
                            tooltipBackgroundColor: Colors.transparent,
                            tooltipTextStyle: const TextStyle(
                              color: Colors.black,
                              height: 0,
                            ),
                          ),
                          child: SfSlider(
                            min: 1,
                            max: 20,
                            labelPlacement: LabelPlacement.betweenTicks,
                            edgeLabelPlacement: EdgeLabelPlacement.auto,
                            shouldAlwaysShowTooltip: true,
                            tooltipShape: const SfPaddleTooltipShape(),
                            tooltipTextFormatterCallback:
                                (dynamic actualValue, String formattedText) {
                              return "less than ${double.parse(actualValue.toString()).round()} km";
                            },
                            value: sliderValue,
                            interval: 20.0,
                            // showTicks: true,
                            // showLabels: true,
                            stepSize: 1,
                            minorTicksPerInterval: 1,
                            onChanged: (dynamic values) {
                              setState(() {
                                print(values);
                                sliderValue = values;
                                controller.distance = int.parse(
                                    values.toString().substring(0, 1));
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsetsDirectional.only(start: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.only(start: 8),
                          child: Text("Type of Accommodation",
                              style: TextStyle(fontSize: 16)),
                        ),
                        ListTileSwitch(
                          contentPadding: const EdgeInsetsDirectional.only(
                              start: 2, end: 16, top: 8, bottom: 8),
                          value: i,
                          // leading: Icon(CupertinoIcons.battery_empty, size: 0,),
                          onChanged: (value) async {
                            setState(() {
                              i = value;
                            });
                          },
                          visualDensity: VisualDensity.comfortable,
                          switchType: SwitchType.cupertino,
                          switchActiveColor: Colors.blue,
                          title: const Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 16, end: 0),
                            child: Text("All"),
                          ),
                        ),
                        ListTileSwitch(
                          contentPadding: const EdgeInsetsDirectional.only(
                              start: 2, end: 16, top: 8, bottom: 8),
                          value: o,
                          // leading: Icon(CupertinoIcons.battery_empty, size: 0,),
                          onChanged: (value) async {
                            setState(() {
                              o = value;
                            });
                          },
                          visualDensity: VisualDensity.comfortable,
                          switchType: SwitchType.cupertino,
                          switchActiveColor: Colors.blue,
                          title: const Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 16, end: 0),
                            child: Text("Apartment"),
                          ),
                        ),
                        ListTileSwitch(
                          contentPadding: const EdgeInsetsDirectional.only(
                              start: 2, end: 16, top: 8, bottom: 8),
                          value: u,
                          // leading: Icon(CupertinoIcons.battery_empty, size: 0,),
                          onChanged: (value) async {
                            setState(() {
                              u = value;
                            });
                          },
                          visualDensity: VisualDensity.comfortable,
                          switchType: SwitchType.cupertino,
                          switchActiveColor: Colors.blue,
                          title: const Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 16, end: 0),
                            child: Text("Home"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      onPressed: () async {
                        if (i == false && o == false && u == false) {
                          showsnackBar(' يجب اختيار النوع ');
                        } else {
                          Get.to(FilterScreen());
                          controller.getdataFromFiltter();
                        }
                      },
                      child: const Text("Apply"),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
