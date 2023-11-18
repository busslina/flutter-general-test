import 'package:busslina_dart_lightweight_lib/busslina_dart_lightweight_lib.dart'
    as llib;
import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.dart';
import 'page_one.dart';

class PageTwo extends ConsumerStatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  ConsumerState<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends ConsumerState<PageTwo> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    ref
                        .read(currentPageProvider.notifier)
                        .changePage(const PageOne());
                  },
                  icon: const Icon(Icons.keyboard_return))
            ],
            bottom: const TabBar(tabs: [
              Tab(text: '1'),
              Tab(text: '2'),
            ]),
          ),
          body: const TabBarView(children: [
            TabContent(text: 'One'),
            TabContent(text: 'Two'),
          ]),
        ),
      );
}

class TabContent extends StatefulWidget {
  final String text;

  const TabContent({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<TabContent> createState() => _TabContentState();
}

class _TabContentState extends State<TabContent>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    llib.debug('_TabContentState.initState() -- ${widget.text}');
  }

  @override
  void dispose() {
    llib.debug('_TabContentState.dispose() -- ${widget.text}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: fllib.Label(
        widget.text,
        color: Colors.black,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
