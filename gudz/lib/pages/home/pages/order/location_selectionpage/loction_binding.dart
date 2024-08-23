import 'package:get/get.dart';
import 'package:gudz/pages/home/pages/order/location_selectionpage/loction_controller.dart';

class LocationSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationSelectionController());
  }
}