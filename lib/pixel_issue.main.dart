import 'package:flutter/material.dart';
import 'package:general_test/pixel_issue/page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageTable(),
      );
}
