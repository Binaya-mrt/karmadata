import 'package:get/get.dart';

import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  var latlong = Rx<Position?>(null);

  @override
  void onInit() {
    super.onInit();
    getCurrentPostion();
  }

  void getCurrentPostion() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latlong.value = position;
  }

  void postLocation() async {}
}
