import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theme App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.white24,
              child: const FittedBox(
                child: Text('BLESSSSTSSTTSTTS'),
              ),
            ),
            Text('Halo', style: textTheme.displayMedium),
            const SizedBox(height: 20),

            // Tombol Dialog
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Platform.isIOS
                    ? showCupertinoDialog(
                  context: context,
                  builder: (_) => CupertinoAlertDialog(
                    title: const Text("Pemberitahuan"),
                    content:
                    const Text("Ini adalah Cupertino Alert Dialog."),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: const Text("OK"),
                        onPressed: () =>
                            Navigator.of(context).pop(),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        child: const Text("Batal"),
                        onPressed: () =>
                            Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                )
                    : showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Pemberitahuan"),
                    content:
                    const Text("Ini adalah Material Alert Dialog."),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pop(),
                        child: const Text("OK"),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pop(),
                        child: const Text("Batal"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Tampilkan Dialog"),
            ),

            const SizedBox(height: 20),

            // Tombol Date Picker
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ON PRESSED
              onPressed: () {
                Platform.isIOS ? showCupertinoModalPopup(
                  context: context,
                  builder: (_) => SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25 ,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (date) {
                        // Handle date change di iOS
                        debugPrint(date.toString());
                      },
                    ),
                  ),
                )
                    // ANDROID
                    : showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                ).then((date) {
                  if (date != null) {
                    debugPrint(date.toString());
                  }
                });
              },
              child: const Text("Pilih Tanggal"),
            ),
          ],
        ),
      ),
    );
  }
}
