import 'package:flutter/material.dart';
import 'package:flutter_second/screens/product_screen.dart';
import 'package:flutter_second/screens/home_screen.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String name = '';
  bool isChecked = false;
  bool isSwitchOn = false;
  String selectedItem = 'Apple';
  int selectedNum = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. TextFormField
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter your name",
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),

            const SizedBox(height: 15),

            // 2. Button
            ElevatedButton(
              onPressed: () {
                print("Hello $name");
              },
              child: const Text("Submit"),
            ),

            const SizedBox(height: 15),

            // 3. Checkbox
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Text("Accept Terms"),
              ],
            ),

            // 4. Switch
            Row(
              children: [
                Switch(
                  value: isSwitchOn,
                  onChanged: (value) {
                    setState(() {
                      isSwitchOn = value;
                    });
                  },
                ),
                const Text("Enable Notifications"),
              ],
            ),

            const SizedBox(height: 15),

            // 5. Dropdown
            DropdownButton<String>(
              value: selectedItem,
              items: ['Apple', 'Banana', 'Mango']
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedItem = value!;
                });
              },
            ),
            DropdownButton<int>(
              value: selectedNum,
              items: [1, 2, 3, 4]
                  .map(
                    (items) =>
                        DropdownMenuItem(value: items, child: Text('data')),
                  )
                  .toList(),
              onChanged: (v) {
                selectedNum = v!;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List pages = [ProductScreen(), HomeScreen()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('')),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.settings_applications),
            label: 'label',
          ),
          NavigationDestination(
            enabled: true,
            icon: Icon(Icons.settings_applications),
            label: 'label',
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
