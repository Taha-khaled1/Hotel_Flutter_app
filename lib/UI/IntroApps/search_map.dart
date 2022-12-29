import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:hotelbooking/UI/Bottom_Nav_Bar/bottomNavBar.dart';
import 'package:hotelbooking/UI/IntroApps/travelSelection.dart';

class SearchInMap extends StatefulWidget {
  @override
  _SearchInMapState createState() => _SearchInMapState();
}

class _SearchInMapState extends State<SearchInMap> {
  String googleApikey = "GOOGLE_MAP_API_KAY";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Search Location";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text('الذهاب الي الصفحه الرئيسيه'),
        onPressed: () {
          setState(() {
            if (button1 == false) {
              Navigator.of(context).pushReplacement(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new BottomNavBar(),
                  transitionDuration: const Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }));
            } else if (button2 == false) {
              Navigator.of(context).pushReplacement(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new BottomNavBar(),
                  transitionDuration: const Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }));
            } else if (button3 == false) {
              Navigator.of(context).pushReplacement(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new BottomNavBar(),
                  transitionDuration: const Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }));
            } else if (button4 == false) {
              Navigator.of(context).pushReplacement(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new BottomNavBar(),
                  transitionDuration: const Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }));
            } else if (button5 == false) {
              Navigator.of(context).pushReplacement(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new BottomNavBar(),
                  transitionDuration: const Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }));
            } else if (button6 == false) {
              Navigator.of(context).pushReplacement(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new BottomNavBar(),
                  transitionDuration: const Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }));
            }
          });
        },
      ),
      appBar: AppBar(
        title: Text("Place Search Autocomplete Google Map"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Stack(
        children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation, //initial position
              zoom: 14.0, //initial zoom level
            ),
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
          ),

          //search autoconplete input
          Positioned(
            //search input bar
            top: 10,
            child: InkWell(
              onTap: () async {
                var place = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: googleApikey,
                    mode: Mode.overlay,
                    types: [],
                    strictbounds: false,
                    components: [Component(Component.country, 'np')],
                    //google_map_webservice package
                    onError: (err) {
                      print(err);
                    });

                if (place != null) {
                  setState(() {
                    location = place.description.toString();
                  });

                  //form google_maps_webservice package
                  final plist = GoogleMapsPlaces(
                    apiKey: googleApikey,
                    apiHeaders: await GoogleApiHeaders().getHeaders(),
                    //from google_api_headers package
                  );
                  String placeid = place.placeId ?? "0";
                  final detail = await plist.getDetailsByPlaceId(placeid);
                  final geometry = detail.result.geometry!;
                  final lat = geometry.location.lat;
                  final lang = geometry.location.lng;
                  var newlatlang = LatLng(lat, lang);

                  //move map camera to selected place with animation
                  mapController?.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(target: newlatlang, zoom: 17)));
                }
              },
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width - 40,
                    child: ListTile(
                      title: Text(
                        location,
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(Icons.search),
                      dense: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
