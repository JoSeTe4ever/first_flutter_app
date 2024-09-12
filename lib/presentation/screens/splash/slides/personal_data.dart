import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class PersonalDataPage extends StatefulWidget {
  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  DateTime _selectedDate = DateTime(1980, 12, 12, 12, 12);
  String _city = 'London';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Personal Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your birthday',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                DatePicker.showDateTimePicker(context,
                    showTitleActions: true,
                    onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      setState(() {
                        _selectedDate = date;
                      });
                    }, currentTime: _selectedDate, locale: LocaleType.en);
              },
              child: Text(
                'Select Date and Time',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Selected: ${_selectedDate.toLocal()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Select your city',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City',
              ),
              onChanged: (value) {
                setState(() {
                  _city = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'City: $_city',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}