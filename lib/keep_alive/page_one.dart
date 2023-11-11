import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:general_test/keep_alive/providers.dart';

import 'page_two.dart';

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
          const fllib.Label('Page one'),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(currentPageProvider.notifier)
                  .changePage(const PageTwo());
            },
            child: const fllib.Label('Go to page two'),
          )
        ],
      ));
}
