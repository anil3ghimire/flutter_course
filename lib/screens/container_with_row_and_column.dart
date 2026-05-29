import 'package:flutter/material.dart';

class ContainerWithRowAndColumn extends StatelessWidget {
  const ContainerWithRowAndColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main vs Cross Axis")),

      body: Container(
        color: Colors.grey.shade300,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.white,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 90,
                    color: Colors.red,
                    child: Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        border: Border.all(color: Colors.black, width: 0),

                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('This is a row'),
                          Icon(Icons.settings_applications),
                        ],
                      ),
                    ),
                  ),
                  Container(width: 60, height: 120, color: Colors.green),
                  Container(width: 60, height: 80, color: Colors.blue),
                  Container(width: 60, height: 80, color: Colors.pink),
                ],
              ),
            ),

            // 🔵 Column Example
            Container(
              color: Colors.white,
              height: 300,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 60, height: 60, color: Colors.red),
                  Container(width: 100, height: 60, color: Colors.green),
                  Container(width: 80, height: 60, color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
