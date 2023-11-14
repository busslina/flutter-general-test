import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:general_test/busslina_table/page.dart';

void main() {
  final tableProviderKey = Object();
  runApp(App(
    tableProviderKey: tableProviderKey,
  ));
}

class App extends StatelessWidget {
  final Object tableProviderKey;

  const App({
    super.key,
    required this.tableProviderKey,
  });

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
        home: PageTable(tableProviderKey: tableProviderKey),
      );
}
