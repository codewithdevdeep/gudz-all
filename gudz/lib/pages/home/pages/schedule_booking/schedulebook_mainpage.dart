import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gudz/pages/home/pages/schedule_booking/pages/scheduleboking_page.dart';
import 'package:gudz/utils/constraint.dart';
import 'package:intl/intl.dart';

class ScheduleBookingPage extends StatefulWidget {
  @override
  _ScheduleBookingPageState createState() => _ScheduleBookingPageState();
}

class _ScheduleBookingPageState extends State<ScheduleBookingPage> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  List<bool> _selectedWeekdays = List.generate(7, (_) => false);

  final List<String> _weekdays = [
    'Every Monday',
    'Every Tuesday',
    'Every Wednesday',
    'Every Thursday',
    'Every Friday',
    'Every Saturday',
    'Every Sunday',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Booking'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMap(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTimeline(),
                    SizedBox(height: 20),
                       Text(
                    'Schedule:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 20),
                    _buildDatePicker(context),
                    SizedBox(height: 10),
                    _buildTimePicker(context),
                    SizedBox(height: 10),
                    _buildWeekdayPicker(context),
                    SizedBox(height: 30),
                    _buildScheduleButton()
                 
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMap() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Adjust the radius as needed
          child: Image.asset(
            'assets/images/maps.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


  Widget _buildTimeline() {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 197, 198, 199),
              ),
            ),
            Container(
              width: 2,
              height: 40,
              color: const Color.fromARGB(255, 210, 212, 213),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 196, 198, 199),
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bengaluru Airport', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
              Text('Kempegowda Int\'l Airport Rd, A - Block, Gangamuthanahalli, Karnataka 560300', style: TextStyle(fontSize: 12)),
              SizedBox(height: 20),
              Text('Koramangala Bus Depot', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
              Text('80 Feet Rd, Venkappa Garden, Koramangala, Bengaluru, Karnataka 560095', style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
  return GestureDetector(
    onTap: () async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
        });
      }
    },
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          DateFormat('EEEE, MMM d').format(_selectedDate),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ),
  );
}

Widget _buildTimePicker(BuildContext context) {
  return GestureDetector(
    onTap: () async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
      );
      if (picked != null && picked != _selectedTime) {
        setState(() {
          _selectedTime = picked;
        });
      }
    },
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          _selectedTime.format(context),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ),
  );
}

Widget _buildWeekdayPicker(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(_weekdays.length, (index) {
                    return CheckboxListTile(
                      title: Text(_weekdays[index]),
                      value: _selectedWeekdays[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _selectedWeekdays[index] = value ?? false;
                        });
                      },
                    );
                  }),
                );
              },
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  this.setState(() {});
                },
              ),
            ],
          );
        },
      );
    },
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          _getSelectedDaysText(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

String _getSelectedDaysText() {
  List<String> selectedDays = [];
  for (int i = 0; i < _selectedWeekdays.length; i++) {
    if (_selectedWeekdays[i]) {
      selectedDays.add(_weekdays[i].split(' ')[1]);
    }
  }
  if (selectedDays.isEmpty) {
    return 'Repeat Weekdays';
  } else if (selectedDays.length == 7) {
    return 'Every day';
  } else {
    return selectedDays.join(', ');
  }
}


  Widget _buildScheduleButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {Get.to(()=>SchedulebokingdeatailPage());},
        child: Text('Schedule'),
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}