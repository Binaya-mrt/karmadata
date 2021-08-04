import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:karmadata/location/location_controller.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({Key? key}) : super(key: key);

  @override
  _HomaPageState createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  @override
  void initState() {
    super.initState();
  }

  final locationController = Get.put(LocationController());

  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => GoogleMap(
                markers: <Marker>{
                  Marker(
                      position: LatLng(
                          locationController.latlong.value!.latitude,
                          locationController.latlong.value!.longitude),
                      markerId: MarkerId(1.toString()),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: MediaQuery.of(context).size.height / 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(),
                                        Column(
                                          children: [
                                            Text('name'),
                                            Text('Phone'),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Rating'),
                                        Text('Price / wages'),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Request Booking'),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }),
                },
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                    target: LatLng(locationController.latlong.value!.latitude,
                        locationController.latlong.value!.longitude),
                    zoom: 17.0),
                zoomControlsEnabled: false,
                myLocationEnabled: true,
              ),
            ),

            IconButton(
              onPressed: () {
                Get.dialog(
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffffffff).withOpacity(0.3),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Card(
                          color: Color(0xffffffff).withOpacity(0.3),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Find Professionals'),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff6b0e0e),
                          ),
                          onPressed: LocationController().getCurrentPostion,
                          child: Text(
                            'Find',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.search_outlined,
                size: 50,
                color: Color(
                  0xff6b0e0e,
                ),
              ),
            )
            //
          ],
        ),
      ),
    );
  }
}
