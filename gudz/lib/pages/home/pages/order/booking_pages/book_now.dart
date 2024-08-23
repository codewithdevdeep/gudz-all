import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gudz/pages/home/pages/order/booking_pages/newbooking.dart';
import 'package:gudz/pages/home/pages/schedule_booking/schedulebook_mainpage.dart';
import 'package:gudz/utils/constraint.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class BookElectricVanPage extends StatefulWidget {
  @override
  _BookElectricVanPageState createState() => _BookElectricVanPageState();
}

class _BookElectricVanPageState extends State<BookElectricVanPage> {
  LocationData? _currentLocation;
  Location _location = Location();
  bool _isLocationInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

void _initializeLocation() async {
  try {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        print("Location services are disabled.");
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Location permissions are denied.");
        return;
      }
    }

    // Set up continuous location updates
    _location.onLocationChanged.listen((LocationData currentLocation) {
      if (mounted) {
        setState(() {
          _currentLocation = currentLocation;
          _isLocationInitialized = true;
        });
      }
    });

    // Get the initial location
    _currentLocation = await _location.getLocation();
    setState(() {
      _isLocationInitialized = true;
    });

  } catch (e) {
    print("Error initializing location: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text('Book an Electric Van', style: GoogleFonts.inter(color: Colors.black)),
        ),
      ),
      body: _isLocationInitialized
        ? Column(
            children: [
              _buildLocationInputs(),
              Expanded(child: _buildMap()),
              _buildBookingButtons(),
            ],
          )
        : Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildLocationInputs() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildLocationTile(Icons.location_on_outlined, 'Your Location', Colors.grey, true),
          SizedBox(height: 8),
          _buildLocationTile(Icons.location_on, 'Koramangala Bus Depot', Colors.red, false),
        ],
      ),
    );
  }

  Widget _buildLocationTile(IconData icon, String text, Color color, bool isPickup) {
    return InkWell(
      onTap: () {
        Get.toNamed('/location_selection', arguments: {'isPickup': isPickup});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            SizedBox(width: 16),
            Text(text, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

 Widget _buildMap() {
  return Container(
    width: double.infinity,
    height: 300,
    child: _currentLocation == null
        ? Center(child: CircularProgressIndicator())
        : FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(
                _currentLocation!.latitude!,
                _currentLocation!.longitude!,
              ),
              initialZoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoiZGV2ZGVlcGtyaXNjZW50IiwiYSI6ImNseXUwN3ZhcDEwM20yaXFseGdwcTFoanoifQ.X3ep5CK5ADraoyBE6pklWA',
                  'id': 'mapbox/streets-v11',
                },
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(
                      _currentLocation!.latitude!,
                      _currentLocation!.longitude!,
                    ),
                    width: 80.0,
                    height: 80.0,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
  );
}

  Widget _buildBookingButtons() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(() => BookingPage());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Book Now', style: TextStyle(fontSize: 18)),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 18),
              ],
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Get.to(() => ScheduleBookingPage());
            },
            child: Text('Schedule Booking', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}