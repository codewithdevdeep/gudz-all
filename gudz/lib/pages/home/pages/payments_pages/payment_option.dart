import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gudz/pages/home/pages/payments_pages/add_upi.dart';
import 'package:gudz/pages/home/pages/payments_pages/gift_card.dart';

class AddPaymentMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Add Payment Method'),
      ),
      body: ListView(
        children: [
          PaymentMethodTile(
            title: 'Gift Card',
            onTap: () {Get.to(GiftCardPage());}
          ),
          PaymentMethodTile(
            title: 'UPI',
            onTap: () {Get.to(()=>AddUPIPage());}
          ),
          PaymentMethodTile(
            title: 'Paytm Wallet',
            onTap: () {}
          ),
          PaymentMethodTile(
            title: 'Credit or Debit Card',
            onTap: (){}
          ),
        ],
      ),
    );
  }

  void _navigateToGiftCard(BuildContext context) {
    // Navigate to Gift Card page
    print('Navigating to Gift Card page');
  }

  void _navigateToUPI(BuildContext context) {
    // Navigate to UPI page
    print('Navigating to UPI page');
  }

  void _navigateToPaytmWallet(BuildContext context) {
    // Navigate to Paytm Wallet page
    print('Navigating to Paytm Wallet page');
  }

  void _navigateToCreditDebitCard(BuildContext context) {
    // Navigate to Credit or Debit Card page
    print('Navigating to Credit or Debit Card page');
  }
}

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const PaymentMethodTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Row(
            children: [
              Icon(Icons.rectangle, color: Colors.grey[600]),
              SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward),
          onTap: onTap,
        ),
      ),
    );
  }
}