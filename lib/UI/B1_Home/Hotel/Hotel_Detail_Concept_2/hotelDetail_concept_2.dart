import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbooking/Library/SupportingLibrary/Ratting/Rating.dart';
import 'package:hotelbooking/UI/B1_Home/Hotel/Hotel_Detail_Concept_1/hotelDetail_concept_1.dart';
import 'package:hotelbooking/UI/handlingView/handlingview.dart';
import 'package:hotelbooking/controller/getInfoRoom_controller.dart';
import 'package:hotelbooking/main.dart';
import 'package:hotelbooking/models/info_room_model.dart';
import 'package:hotelbooking/resourse/mange_link_api.dart';
import 'package:like_button/like_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:hotelbooking/UI/B1_Home/Hotel/Hotel_Detail_Concept_2/reviewsDetail2.dart';

import 'maps.dart';

class hotelDetail2 extends StatefulWidget {
  double? ratting;
  hotelDetail2();

  @override
  _hotelDetail2State createState() => _hotelDetail2State();
}

class _hotelDetail2State extends State<hotelDetail2> {
  final Set<Marker> _markers = {};
  final LatLng _currentPosition = const LatLng(40.7078523, -74.008981);

  void initState() {
    _markers.add(
      Marker(
        markerId: const MarkerId("40.7078523, -74.008981"),
        position: _currentPosition,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    var _ratting = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
          child: Text(
            "Ratting",
            style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: <Widget>[
              const Text(
                "Location",
                style: TextStyle(
                    fontFamily: "Sofia",
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 20.0,
              ),
              new LinearPercentIndicator(
                width: _width - 135,
                lineHeight: 9.0,
                percent: 0.9,
                progressColor: const Color(0xFF8F73F2),
                animation: true,
                backgroundColor: const Color(0xFFDADBDF),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 13.0),
          child: Row(
            children: <Widget>[
              const Text(
                "Cleaning",
                style: TextStyle(
                    fontFamily: "Sofia",
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 17.0,
              ),
              new LinearPercentIndicator(
                width: _width - 135,
                lineHeight: 9.0,
                percent: 0.75,
                progressColor: const Color(0xFF8F73F2),
                animation: true,
                backgroundColor: const Color(0xFFDADBDF),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 13.0),
          child: Row(
            children: <Widget>[
              const Text(
                "Service",
                style: TextStyle(
                    fontFamily: "Sofia",
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 28.0,
              ),
              new LinearPercentIndicator(
                width: _width - 135,
                lineHeight: 9.0,
                percent: 0.8,
                progressColor: const Color(0xFF8F73F2),
                animation: true,
                backgroundColor: const Color(0xFFDADBDF),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 13.0),
          child: Row(
            children: <Widget>[
              const Text(
                "Price",
                style: TextStyle(
                    fontFamily: "Sofia",
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 45.0,
              ),
              new LinearPercentIndicator(
                width: _width - 135,
                lineHeight: 9.0,
                percent: 0.95,
                progressColor: const Color(0xFF8F73F2),
                animation: true,
                backgroundColor: const Color(0xFFDADBDF),
              ),
            ],
          ),
        ),
      ],
    );

    var _location = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding:
              EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0, bottom: 10.0),
          child: Text(
            "Location",
            style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 190.0,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(40.7078523, -74.008981),
                    zoom: 13.0,
                  ),
                  markers: _markers,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 135.0, right: 60.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => maps()));
                    },
                    child: Container(
                      height: 35.0,
                      width: 95.0,
                      decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30.0))),
                      child: const Center(
                        child: Text("See Map",
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Sofia")),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );

    var _reviews = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 50.0, left: 20.0, right: 20.0, bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Reviews",
                style: TextStyle(
                    fontFamily: "Sofia",
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.justify,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => reviewDetail2()));
                  },
                  child: const Text(
                    "See More",
                    style: TextStyle(
                        fontFamily: "Sofia",
                        color: Color(0xFF8F73F2),
                        fontWeight: FontWeight.w600),
                  ))
            ],
          ),
        ),
        reviewList(
          image: "assets/image/profile/pp1.jpg",
          name: "Abella Ayob",
          time: "21:45",
        ),
        reviewList(
          image: "assets/image/profile/pp2.jpg",
          name: "Logan Lopi",
          time: "19:20",
        ),
      ],
    );

    var _button = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 55.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF8F73F2),
                        Colors.deepPurpleAccent,
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp)),
              child: const Center(
                child: Text(
                  "Book Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      fontFamily: "Sofia",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<GetInfoHotelController>(
          init: GetInfoHotelController(),
          initState: (cont) {},
          builder: (cont) {
            return HandlingDataView(
              statusRequest: cont.statusRequest,
              widget: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  /// AppBar
                  SliverPersistentHeader(
                    delegate: MySliverAppBar(
                        expandedHeight: _height - 30.0,
                        datahot: cont.infoRoomModel),
                    pinned: true,
                  ),

                  SliverToBoxAdapter(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        /// Description
                        DescrabtionWidget(
                            des: cont.infoRoomModel?.message?.desc),

                        /// Ratting
                        _ratting,

                        /// Location
                        _location,

                        /// Reviews

                        /// Photo
                        PhotoWidget(controller: cont),
                        Container(
                          height: 210.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: cont.infoRoomModel?.hotelRooms!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return relatedPost(
                                  cont.infoRoomModel?.hotelRooms![index].imgs ??
                                      '',
                                  cont.infoRoomModel?.hotelRooms![index].title,
                                  cont.infoRoomModel?.hotelRooms![index].city,
                                  cont.infoRoomModel?.hotelRooms![index]
                                      .averageRating
                                      .toString(),
                                  cont.infoRoomModel?.hotelRooms![index].sId);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        /// Button
                        _button,
                      ])),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final GetInfoHotelController controller;
  @override
  Widget build(BuildContext context) {
    List<String> ph =
        controller.infoRoomModel?.message?.imgs!.split(',') ?? [''];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding:
              EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 10.0),
          child: Text(
            "Photo",
            style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.justify,
          ),
        ),
        Container(
          height: 150.0,
          child: ListView.builder(
            itemCount: ph.length,
            itemBuilder: (BuildContext context, int index) {
              return _photo(ph[index], "2a31sd2ds", context);
            },
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}

class DescrabtionWidget extends StatelessWidget {
  const DescrabtionWidget({
    Key? key,
    this.des,
  }) : super(key: key);
  final String? des;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding:
              EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
          child: Text(
            "Description",
            style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0, bottom: 50.0),
          child: Text(
            des ?? '',
            style: TextStyle(
                fontFamily: "Sofia",
                color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  InfoHotelModel? datahot;

  MySliverAppBar({
    this.datahot,
    required this.expandedHeight,
  });

  var _txtStyleTitle = const TextStyle(
    color: Colors.black54,
    fontFamily: "Sofia",
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
  );

  var _txtStyleSub = const TextStyle(
    color: Colors.black26,
    fontFamily: "Sofia",
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          height: 50.0,
          width: double.infinity,
          color: Colors.white,
        ),
        Opacity(
          opacity: (1 - shrinkOffset / expandedHeight),
          child: Hero(
            tag: 'hero-tag-${datahot?.message?.sId}',
            child: new DecoratedBox(
              decoration: new BoxDecoration(
                image: datahot?.message?.imgs == null ||
                        datahot?.message?.imgs == ""
                    ? DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5dEwOb8aCwl457d-k9xo2cwlAbz2zwH8tXA&usqp=CAU'))
                    : DecorationImage(
                        image: NetworkImage(
                          '${MangeAPi.baseurl}/${datahot?.message?.imgs!.split(',').first ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5dEwOb8aCwl457d-k9xo2cwlAbz2zwH8tXA&usqp=CAU'}',
                        ),
                        fit: BoxFit.cover),
                shape: BoxShape.rectangle,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 620.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(0.0, 1.0),
                    stops: [0.0, 1.0],
                    colors: <Color>[
                      Color(0x00FFFFFF),
                      Color(0xFFFFFFFF),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, right: 20.0, left: 20.0, bottom: 40.0),
              child: Container(
                height: 170.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white.withOpacity(0.85)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 2.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      width: 210.0,
                                      child: Text(
                                        datahot?.message?.name ?? 'name',
                                        style: _txtStyleTitle.copyWith(
                                            fontSize: 27.0),
                                        overflow: TextOverflow.clip,
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ratingbar(
                                        size: 22,
                                        starRating:
                                            datahot?.message?.rating ?? 0.0,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Icon(
                                              Icons.location_on,
                                              size: 14.0,
                                              color: Colors.black26,
                                            ),
                                            Text(
                                              datahot?.message?.city ?? 'city',
                                              style: const TextStyle(
                                                  color: Colors.black26,
                                                  fontSize: 14.5,
                                                  fontFamily: "Sofia",
                                                  fontWeight: FontWeight.w400),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const LikeButton(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40.0),
                            ),
                            color: Colors.white70,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                    ))),
            const SizedBox(
              width: 36.0,
            )
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

Widget _photo(String image, id, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Material(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) {
                    return new Material(
                      color: Colors.black54,
                      child: Container(
                        padding: const EdgeInsets.all(30.0),
                      ),
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 500)));
            },
            child: Container(
              height: 130.0,
              width: 130.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('${MangeAPi.baseurl}/${image}'),
                      fit: BoxFit.cover),
                  color: Colors.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.black12.withOpacity(0.1),
                        spreadRadius: 2.0)
                  ]),
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
      ],
    ),
  );
}

class reviewList extends StatelessWidget {
  String? image, name, time;
  reviewList({this.image, this.name, this.time});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        //    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=>new chatting(name: this.name,)));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image!), fit: BoxFit.cover),
                      color: Colors.black12,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                              color: Colors.black12.withOpacity(0.05))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name!,
                              style: const TextStyle(
                                fontFamily: "Sofia",
                                fontWeight: FontWeight.w700,
                                fontSize: 17.0,
                                color: Colors.black,
                              )),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                              width: _width - 140.0,
                              child: const Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                style: TextStyle(
                                    fontFamily: "Sofia",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13.5,
                                    color: Colors.black45),
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.justify,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget relatedPost(String? image, String? title, String? location,
    String? ratting, String? id) {
  return InkWell(
    onTap: () {
      sharedPreferences.setString('keyroom', id.toString());
      Get.off(HotelDetail());
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 110.0,
            width: 180.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image == null || image == ""
                      ? 'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202204/ezgif-sixteen_nine_161.jpg?size=948:533'
                      : "${MangeAPi.baseurl}/${image.split(',').first}"),
                  fit: BoxFit.cover,
                ),
                color: Colors.black12,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.black12.withOpacity(0.1),
                      spreadRadius: 2.0)
                ]),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            title ?? 'titel',
            style: const TextStyle(
                fontFamily: "Sofia",
                fontWeight: FontWeight.w600,
                fontSize: 17.0,
                color: Colors.black87),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Icon(
                Icons.location_on,
                size: 18.0,
                color: Colors.black12,
              ),
              Text(
                location ?? 'Loction',
                style: const TextStyle(
                    fontFamily: "Sofia",
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                    color: Colors.black26),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.star,
                size: 18.0,
                color: Colors.yellow,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  ratting ?? '4',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Sofia",
                      fontSize: 13.0),
                ),
              ),

              // Text("(233 Rating)",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Sofia",fontSize: 11.0,color: Colors.black45),),
              const SizedBox(
                width: 35.0,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
