import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Kelas Counter yang mengelola state (data)
class Counter with ChangeNotifier {
  int _counter = 0; // ga perlu nullable

  int get counts => _counter;

  // Method untuk menambah nilai counter
  void add() {
    _counter += 1;
    notifyListeners(); // Memberitahu semua Consumer untuk rebuild
  }

  // Method untuk mengurangi nilai counter
  void minus() {
    _counter -= 1;
    notifyListeners(); // Memberitahu semua Consumer untuk rebuild
  }
}

void main() {
  runApp(const MyProvider());
}

class MyProvider extends StatelessWidget {
  const MyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
      ],
      child: const MaterialApp(
        home: ProvScreen(),
      ),
    );
  }
}

class ProvScreen extends StatelessWidget {
  const ProvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROVIDERS TEST'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counter>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    Text(
                      value.counts.toString(),
                      style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 40,
                          onPressed: value.add,
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                        const SizedBox(width: 40),
                        IconButton(
                          iconSize: 40,
                          onPressed: value.minus,
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}