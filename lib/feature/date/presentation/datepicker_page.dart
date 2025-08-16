import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Datepicker extends StatefulWidget {
  const Datepicker({super.key});

  @override
  State<Datepicker> createState() => _DatepickerState();
}

class _DatepickerState extends State<Datepicker> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date Picker')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _selectedDate == null
                    ? 'Tanggal belum dipilih'
                    : 'Tanggal terpilih: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),

              // Datebutton
              ElevatedButton(
                onPressed: () {
                  Platform.isIOS ? showCupertinoModalPopup(
                    context: context,
                    builder: (_) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: _selectedDate ?? DateTime.now(),
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() {
                                _selectedDate = newDate;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  )
                      : showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _selectedDate = value;
                      });
                    }
                  });
                },
                child: const Text('Pilih Tanggal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
