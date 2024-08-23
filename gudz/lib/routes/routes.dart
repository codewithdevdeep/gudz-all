import 'package:get/get.dart';
import 'package:gudz/pages/home/pages/order/booking_pages/book_now.dart';
import 'package:gudz/pages/home/pages/order/booking_pages/booking_deatail.dart';
import 'package:gudz/pages/home/pages/order/location_selectionpage/LocationSelectionPage.dart';
import 'package:gudz/pages/home/pages/order/location_selectionpage/loction_binding.dart';

import 'package:gudz/pages/home/pages/order/order.dart';
import 'package:gudz/pages/home/pages/payments_pages/payment.dart';
import 'package:gudz/pages/splashscreen.dart';



class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/orders', page: () => OrdersPage()),
    GetPage(name: '/payments', page: () => PaymentsPage()),
    GetPage(name: '/book_electric_van', page: () => BookElectricVanPage()),
    GetPage(
      name: '/location_selection',
      page: () => LocationSelectionPage(),
      binding: LocationSelectionBinding(),
    ),
    GetPage(name: '/booking_deatail', page: () => BookingDetailsPage()),
  ];
}