import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gudz/pages/home/pages/order/booking_pages/book_now.dart';

import 'package:gudz/utils/constraint.dart';

class OrdersController extends GetxController {
  // You can add more functionality here, like fetching orders from an API
  final orders = [
    {'location': 'Koramangala Bus Depot', 'dateTime': 'Sunday, May 18 | 12:00 PM', 'price': '₹651.00'},
    {'location': 'Koramangala Bus Depot', 'dateTime': 'Sunday, May 18 | 12:00 PM', 'price': '₹450.00'},
    {'location': 'Koramangala Bus Depot', 'dateTime': 'Sunday, May 18 | 12:00 PM', 'price': '₹450.00'},
  ].obs;

  void onOrderTap(Map<String, String> order) {
    print('Tapped on order: ${order['location']} - ${order['dateTime']}');
    // Navigate to order details page
    Get.to(() => BookElectricVanPage());
  }
}

class OrdersPage extends GetView<OrdersController> {
  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    Get.put(OrdersController());

    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: Obx(() => ListView.separated(
              itemCount: controller.orders.length,
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                final order = controller.orders[index];
                return _buildOrderCard(order);
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      child: SafeArea(
        child: Text(
          'Orders',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, String> order) {
    return GestureDetector(
      onTap: () => controller.onOrderTap(order),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order['location']!,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    order['dateTime']!,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    order['price']!,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}

