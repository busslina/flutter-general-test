import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';

class PageTable extends StatelessWidget {
  const PageTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          _buildExpandedChild(),
          _buildExpandedChild(),
          _buildExpandedChild(),
          _buildExpandedChild(),
        ],
      ).bgColor(Colors.black);

  Widget _buildExpandedChild() => Expanded(
        flex: 1,
        child: const fllib.Label(
          'Hey',
          textAlign: TextAlign.center,
          color: Colors.black,
        ).sized(height: double.infinity).bgColor(Colors.blue),
      );
}
