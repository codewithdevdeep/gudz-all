import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gudz/pages/home/pages/order/booking_pages/newbooking.dart';
import 'package:gudz/pages/home/pages/schedule_booking/schedulebook_mainpage.dart';
import 'package:gudz/utils/constraint.dart';

class MultilocationOrder extends StatelessWidget {
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
        title: Text('Book an Electric Van', 
          style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildLocationInputs(),
          Expanded(child: _buildMap()),
          _buildBookingButtons(),
        ],
      ),
    );
  }

  Widget _buildLocationInputs() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildLocationTile(Icons.circle, 'Church Street', Colors.blue, true),
          SizedBox(height: 8),
          _buildLocationTile(Icons.circle, 'Mall Road', Colors.blue, true),
          SizedBox(height: 8),
          _buildLocationTile(Icons.circle, 'Koramangala Bus Depot', Colors.red, false),
        ],
      ),
    );
  }

  Widget _buildLocationTile(IconData icon, String text, Color color, bool isPickup) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          SizedBox(width: 16),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 16)),
          ),
          Icon(Icons.menu, color: Colors.grey),
          SizedBox(width: 8),
          Icon(Icons.close, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return Container(
      width: double.infinity,
      child: Image.asset(
        'assets/images/maps.png',
        fit: BoxFit.cover,
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