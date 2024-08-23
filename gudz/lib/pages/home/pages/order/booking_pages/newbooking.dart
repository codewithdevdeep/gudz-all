import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gudz/pages/home/pages/order/booking_pages/booking_deatail.dart';
import 'package:gudz/utils/constraint.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:timeline_tile/timeline_tile.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking #10004563'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          SlidingUpPanel(
            panel: BookingDetailsPanel(),
            body: ImageView(),
            minHeight: 180,
            maxHeight: 450,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BookingActions(),
          ),
        ],
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/maps.png',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

class BookingDetailsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 4,
          width: 40,
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        DriverInfo(),
      ],
    );
  }
}

class DriverInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/driver.png'),
                radius: 24,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tata Ace | KA M6 7632',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      'Abhinshek M',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: kPrimaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.phone_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  // Handle phone call
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: true,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: const Color.fromARGB(255, 120, 120, 121),
              padding: EdgeInsets.all(6),
            ),
            endChild: _buildTimelineContent(
              'Pickup: 26 Jan, 8:00PM',
              '1604 Amphitheatre Parkway, Mountain\nView, CA',
              '+91 41585 04130',
            ),
            beforeLineStyle: LineStyle(color: Colors.grey),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isLast: true,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: const Color.fromARGB(255, 121, 123, 125),
              padding: EdgeInsets.all(6),
            ),
            endChild: _buildTimelineContent(
              'Pickup: 27 Jan, 11:00PM',
              '7146 Stevenson Blvd, Fremont, CA',
              '',
            ),
            beforeLineStyle: LineStyle(color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ₹651.00',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'CASH',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineContent(String title, String address, String phone) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 4),
          Text(address),
          if (phone.isNotEmpty) Text(phone),
        ],
      ),
    );
  }
}

class BookingActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              child: Text('Cancel Booking'),
              onPressed: () {
                Get.to(() => BookingDetailsPage());
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              child: Text('Need Help?'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey[200],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
