import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageWidget(),
      );
}

class PageWidget extends StatelessWidget {
  static const _constraints = BoxConstraints(minWidth: 350);

  const PageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: [
            _buildFieldset(),
          ],
        )
            .bgColor(
              Colors.red,
            )
            .withMargin(
              const EdgeInsets.all(20),
            ),
      ).bgColor(
        Colors.orange,
      );

  Widget _buildFieldset() => Container(
        // width: 0,
        child: Column(
          children: [
            const fllib.Label('Field 1').sized(width: 100).bgColor(Colors.pink),
            const fllib.Label('Field 2')
                .sized(width: 200)
                .bgColor(Colors.pink)
                .marginTop(10),
            const fllib.Label('Field 3')
                .sized(width: 400)
                .bgColor(Colors.pink)
                .marginTop(10),
            const fllib.Label('Field 4')
                .sized(width: 600)
                .bgColor(Colors.pink)
                .marginTop(10),
          ],
        )
            .bgColor(
              Colors.green,
              active: true,
            )
            .withSizeConstraints(
              _constraints,
            )
            .centered(),
      )
          .bgColor(
            Colors.yellow,
          )
          .withSizeConstraints(
            _constraints,
          )
          .centered(active: true);
}
