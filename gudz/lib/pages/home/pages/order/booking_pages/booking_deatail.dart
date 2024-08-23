import 'package:flutter/material.dart';
import 'package:gudz/utils/constraint.dart';
import 'package:timeline_tile/timeline_tile.dart';

class BookingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order #10012',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              'Placement Time: 26 Jan, 2023',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            _buildTimeline(),
            SizedBox(height: 20),
            _buildInfoRow(Icons.description, 'Delivery Documents', true),
            SizedBox(height: 10),
            _buildInfoRow(Icons.account_balance_wallet, 'Payment Method: Gutz Wallet', true),
            SizedBox(height: 20),
            Text(
              'Order Items:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildOrderItem('Parcel Box', 2, 750.00),
            SizedBox(height: 20),
            _buildTotalSection(),
            _buildTotalRow('Total', '₹10.00', isBold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.0,
          isFirst: true,
          indicatorStyle: IndicatorStyle(
            width: 20,
            color: const Color.fromARGB(255, 154, 161, 166),
            padding: EdgeInsets.only(left: 4, top: 6, bottom: 6, right: 16),
          ),
          endChild: _buildTimelineContent(
            'Pickup: 26 Jan, 8:00PM',
            '1604 Amphitheatre Parkway, Mountain\nview, CA',
            '+91 41585 04130',
          ),
          beforeLineStyle: LineStyle(color: Colors.grey, thickness: 2),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.0,
          isLast: true,
          indicatorStyle: IndicatorStyle(
            width: 20,
            color: const Color.fromARGB(255, 137, 143, 149),
            padding: EdgeInsets.only(left: 4, top: 6, bottom: 6, right: 16),
          ),
          endChild: _buildTimelineContent(
            'Pickup: 27 Jan, 11:00PM',
            '7146 Stevenson Blvd, Fremont, CA',
            'Cancellation & waiting policy',
            isLink: true,
          ),
          beforeLineStyle: LineStyle(color: Colors.grey, thickness: 2),
        ),
      ],
    );
  }

  Widget _buildTimelineContent(String title, String address, String additional, {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          SizedBox(height: 4),
          Text(address),
          SizedBox(height: 4),
          Text(
            additional,
            style: TextStyle(
              color: isLink ? kPrimaryColor : Colors.black,
              decoration: isLink ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, bool hasArrow) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kPrimaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon, color: Color.fromARGB(255, 250, 252, 255)),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            if (hasArrow) Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String name, int quantity, double price) {
    return Row(
      children: [
        Text('$quantity', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        SizedBox(width: 10),
        Expanded(
          child: Text(name, style: TextStyle(color: Colors.black)),
        ),
        Text('₹${price.toStringAsFixed(2)},', style: TextStyle(color: Colors.black)),
      ],
    );
  }

  Widget _buildTotalSection() {
    return Column(
      children: [
        Divider(),
        _buildTotalRow('Total Fare:', '₹750.00'),
        _buildTotalRow('Coupon Discount:', '₹99.00', isGreen: true),
        _buildTotalRow('CGST Tax:', '₹0.00'),
        _buildTotalRow('SGST Tax:', '₹0.00'),
      ],
    );
  }

  Widget _buildTotalRow(String label, String amount, {bool isGreen = false, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: Colors.black)),
          Text(
            amount,
            style: TextStyle(
              color: isGreen ? Colors.green : Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
