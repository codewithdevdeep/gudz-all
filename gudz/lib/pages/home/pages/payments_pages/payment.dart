// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gudz/pages/home/pages/payments_pages/payment_option.dart';
import 'package:gudz/utils/constraint.dart';

class PaymentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              _buildHeader(),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                _buildGudtWallet(),
                _buildOtherPaymentMethods(),
                _buildPromotions(),
                SizedBox(height: 10,),
                _buildAddNewPaymentMethod(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container( 
      padding: EdgeInsets.fromLTRB(20, 10, 16, 16),
      child: SafeArea(
        child: Text(
          'Payments',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }

  Widget _buildGudtWallet() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 127, 92, 215)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Gudz Wallet', style: GoogleFonts.inter(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14)),
              Text('₹450.00', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black)),
            ],
          ),
          SizedBox(height: 8),
          Text('We Accept Credit & Debit Cards, UPI, Netbanking, etc.', style: GoogleFonts.inter(fontSize: 12)),
          SizedBox(height: 8),
          Row(
            children: [
              Image.asset('assets/images/visa.png', width: 100, height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOtherPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text('Other Payment Methods', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: ListTile(
            title: Text('Paytm - gudzhq@oksbifank', style: GoogleFonts.inter(color: Colors.black)),
            subtitle: Text('Experience Cashless Rides', style: GoogleFonts.inter(fontSize: 12)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: ListTile(
            title: Text('Cash', style: GoogleFonts.inter(color: Colors.black)),
            subtitle: Text('Pay for your booking in cash after delivery.', style: GoogleFonts.inter(fontSize: 12)),
          ),
        ),
      ],
    );
  }

  Widget _buildPromotions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text('Promotions', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 47),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Available Offers', style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: Colors.black)),
              SizedBox(height: 5,),
              Text('View All', style: GoogleFonts.inter(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddNewPaymentMethod() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {Get.to(()=>AddPaymentMethodPage());},
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Add New Payment Methods', style: GoogleFonts.inter(color: Colors.black)),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
