import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:general_test/keep_alive/providers.dart';

import 'page_two.dart';
import 'page_three.dart';

class PageOne extends ConsumerStatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  ConsumerState<PageOne> createState() => _PageOneState();
}

class _PageOneState extends ConsumerState<PageOne> {
  @override
  Widget build(BuildContext context) => Center(
          child: Column(
        children: [
          // Title
          const fllib.Label('Page one'),

          // Button page 2
          ElevatedButton(
            onPressed: () {
              ref
                  .read(currentPageProvider.notifier)
                  .changePage(const PageTwo());
            },
            child: const fllib.Label('Page 2'),
          ),

          // Button page 3
          ElevatedButton(
            onPressed: () {
              ref
                  .read(currentPageProvider.notifier)
                  .changePage(const PageThree());
            },
            child: const fllib.Label('Page 3'),
          ),
        ],
      ));
}
