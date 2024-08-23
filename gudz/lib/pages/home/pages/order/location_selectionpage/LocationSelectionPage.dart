import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gudz/pages/home/pages/order/location_selectionpage/loction_controller.dart';

class LocationSelectionPage extends GetView<LocationSelectionController> {
  LocationSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final isPickup = args?['isPickup'] as bool? ?? true;
    controller.setPickup(isPickup);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Obx(() => Text(
          controller.isPickup.value ? 'Pickup' : 'Destination',
          style: GoogleFonts.inter(color: Colors.black),
        )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: controller.updateSearchQuery,
              decoration: InputDecoration(
                hintText: 'Bengaluru',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.locations.length,
              itemBuilder: (context, index) {
                return _buildLocationItem(controller.locations[index]);
              },
            )),
          ),
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildLocationItem(String location) {
    return ListTile(
      leading: Icon(Icons.location_on, color: Colors.grey),
      title: Text(location),
      onTap: () => controller.selectLocation(location),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => controller.useCurrentLocation(),
              icon: Icon(Icons.my_location),
              label: Text('Current Location'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => controller.openMap(),
              icon: Icon(Icons.map),
              label: Text('Locate on Map'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}