import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:gudz/pages/home/pages/order/booking_pages/booking_historypage.dart';
import 'package:gudz/pages/home/pages/order/booking_pages/multilocation_order.dart';
import 'package:gudz/pages/home/pages/order/order.dart';
import 'package:gudz/pages/home/pages/payments_pages/payment.dart';
import 'package:gudz/pages/home/pages/profile/setting.dart';
import 'package:gudz/utils/constraint.dart';

class HomePage extends StatelessWidget {
  final RxInt _selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Obx(() => IndexedStack(
            index: _selectedIndex.value,
            children: [
              _buildHomeContent(theme),
              OrdersPage(),
              PaymentsPage(),
              ProfilePage()
              
            ],
          )),
        ),
        bottomNavigationBar: _buildBottomNavBar(theme),
      ),
    );
  }

  Widget _buildHomeContent(ThemeData theme) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildHomeHeader(theme)),
        SliverToBoxAdapter(child: _buildTripTypeSelector(theme)),
        SliverToBoxAdapter(child: _buildLocationInput(theme)),
        SliverToBoxAdapter(child: _buildRecentBookings(theme)),
      ],
    );
  }



  


 Widget _buildHomeHeader(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 16, 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Home',
          style: GoogleFonts.inter(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
Widget _buildTripTypeSelector(ThemeData theme) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    child: DefaultTabController(
      length: 3,
      child: TabBar(
        isScrollable: true,
        unselectedLabelColor: theme.unselectedWidgetColor,
        labelColor: Colors.white,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.primaryColor,
        ),
        indicatorPadding: EdgeInsets.zero,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        padding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.only(right: 16),
        tabAlignment: TabAlignment.start,
        tabs: [
          Tab(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
             
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(width: 8),
                  Text('One Way', style: GoogleFonts.inter()),
                ],
              ),
            ),
          ),
          Tab(
            
            child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.map),
                  const SizedBox(width: 8),
                  Text('Multiple Stops', style: GoogleFonts.inter()),
                ],
              ),
            ),
          ),
          Tab(
            child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0),
           
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.refresh),
                  const SizedBox(width: 8),
                  Text('Round Trip', style: GoogleFonts.inter()),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildLocationInput(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.circle, size: 20),
                iconColor: Colors.grey[600],
                hintText: 'Drop Location',
                hintStyle: GoogleFonts.inter(color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildLocationItem('Bengaluru Airport', 'Kempegowda Int\'l Airport Rd, Devanahalli', theme),
          _buildLocationItem('Bengaluru Railway Station', 'KSR Bengaluru, Krantivira Sangolli Ra..', theme),
          _buildLocationItem('Bengaluru Railway Station', 'KSR Bengaluru, Krantivira Sangolli Ra..', theme),
        ],
      ),
    );
  }

  Widget _buildLocationItem(String title, String subtitle, ThemeData theme) {
    return ListTile(
      leading: const Icon(Icons.access_time, color: Colors.black),
      title: Text(
        title,
        style: GoogleFonts.inter(
          textStyle: theme.textTheme.bodyLarge,
          fontWeight: FontWeight.normal,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.inter(textStyle: theme.textTheme.bodyMedium),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      dense: true,
    );
  }

  Widget _buildRecentBookings(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
       
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Recent Bookings:',
              style: GoogleFonts.inter(
                textStyle: theme.textTheme.titleMedium,
                color: Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          _buildBookingItem('Koramangala Bus Depot', 'Sunday, May 18 | 12:00 PM', '₹651.00', theme),
          const SizedBox(height: 12),
          _buildBookingItem('Koramangala Bus Depot', 'Sunday, May 18 | 12:00 PM', '₹450.00', theme),
          const SizedBox(height: 12),
          _buildBookingItem('Koramangala Bus Depot', 'Sunday, May 18 | 12:00 PM', '₹450.00', theme),
        ],
      ),
    );
  }

  Widget _buildBookingItem(String location, String dateTime, String price, ThemeData theme) {
    return InkWell(
      onTap: (){Get.to(()=>OldBookingDetailsPage());},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 1),
      
           boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
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
                    location,
                    style: GoogleFonts.inter(
                      textStyle: theme.textTheme.bodyLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dateTime,
                    style: GoogleFonts.inter(
                      textStyle: theme.textTheme.bodyMedium,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: GoogleFonts.inter(
                      textStyle: theme.textTheme.bodyMedium,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(8),
                 boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
              ),
              child: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }


  // ... (rest of your existing methods)

  Widget _buildBottomNavBar(ThemeData theme) {
    return Obx(() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: theme.primaryColor,
      unselectedItemColor: Colors.grey[600],
      selectedLabelStyle: GoogleFonts.inter(fontSize: 12),
      unselectedLabelStyle: GoogleFonts.inter(fontSize: 12),
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.add_home_outlined),
          activeIcon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/order.png',
            width: 24,
            height: 24,
            color: Colors.grey[600],
          ),
          activeIcon: Image.asset(
            'assets/images/order.png',
            width: 24,
            height: 24,
            color: theme.primaryColor,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/Shape.png',
            width: 24,
            height: 24,
            color: Colors.grey[600],
          ),
          activeIcon: Image.asset(
            'assets/images/Shape.png',
            width: 24,
            height: 24,
            color: theme.primaryColor,
          ),
          label: 'Payments',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          activeIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: _selectedIndex.value,
      onTap: (index) => _selectedIndex.value = index,
    ));
  }
}



