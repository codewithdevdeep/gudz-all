import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gudz/utils/constraint.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildProfileHeader(),
                  _buildProfileActions(),
                  SizedBox(height: 20,),
                  _buildProfileOptions(),
                 
                ],
              ),
            ),
             _buildLogoutButton(),
          ],
        ),
      ),
      
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Profile',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.black,
            ),
          ),
          CircleAvatar(
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        Row(
          children: [
            Text('Pranav Chaparala', style: GoogleFonts.inter(fontSize: 24, color: Colors.black)),
            SizedBox(width: 10,),            Text('4.5', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 12,color: kPrimaryColor)),
            Icon(Icons.star, color:kPrimaryColor, size: 16),
          ],
        ),
        SizedBox(height: 8),
        Text('pranavchapala@gmail.com', style: GoogleFonts.inter(color: Colors.grey)),
        Text('+91 98765 43212', style: GoogleFonts.inter(color: Colors.grey)),
      ],
    );
  }

  Widget _buildProfileActions() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.send, size: 18),
              label: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text('Share Details', style: GoogleFonts.inter(fontSize: 14)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:kPrimaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.help_outline, size: 18),
              label: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text('Need Help?', style: GoogleFonts.inter(fontSize: 14)),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey[200],
             
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOptions() {
    return Column(
      children: [
        _buildOptionTile('Saved Addresses'),
        _buildOptionTile('Privacy'),
        _buildOptionTile('Security'),
      ],
    );
  }

  Widget _buildOptionTile(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(Icons.square,color: Colors.grey[300],),
              SizedBox(width: 5,),
              Text(title, style: GoogleFonts.inter()),
            ],
          ),
        ),
        trailing: Icon(Icons.arrow_forward, size: 16),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Logout', style: GoogleFonts.inter(fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFD3625F),
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }}

