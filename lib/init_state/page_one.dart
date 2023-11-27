import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageOne extends ConsumerStatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  ConsumerState<PageOne> createState() => _PageOneState();
}

class _PageOneState extends ConsumerState<PageOne> {
  @override
  void initState() {
    super.initState();

    fllib.debug('_PageOneState.initState()');
  }

  @override
  Widget build(BuildContext context) => const Center(
          child: Column(
        children: [
          // Title
          fllib.Label('Page one'),
        ],
      ));
}
