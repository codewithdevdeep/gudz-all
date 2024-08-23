import 'package:get/get.dart';

class LocationSelectionController extends GetxController {
  final RxBool isPickup = true.obs;
  final RxString searchQuery = ''.obs;
  final RxList<String> locations = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    locations.value = [
      'Bengaluru Airport',
      'Bengaluru Railway Station',
      'Bengaluru Bus Stand',
      'Bengaluru Marriott Hotel',
      'Bengaluru International Centre',
    ];
  }

  void setPickup(bool value) {
    isPickup.value = value;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    // Implement search logic here
  }

  void selectLocation(String location) {
    Get.back(result: location);
  }

  void useCurrentLocation() {
    // Implement logic to get and use current location
    print('Using current location');
    // After getting the location, you might want to call selectLocation()
  }

  void openMap() {
    // Implement logic to open a map view
    print('Opening map view');
    // After selecting a location on the map, you might want to call selectLocation()
  }
}