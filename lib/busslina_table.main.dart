import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
          },
        ),
        home: Column(
          children: [
            // Bar
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.red,
              child: ListView.builder(
                itemCount: 25,
                itemBuilder: (context, index) => _buildItem(index),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
              ),
            ),

            // Body
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      );

  Widget _buildItem(int index) => Container(
        color: Colors.yellow,
        width: 150,
        child: Text(
          'Item $index',
          style: TextStyle(fontSize: 14),
        ),
      );
}
