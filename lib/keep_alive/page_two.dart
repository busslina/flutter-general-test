import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;
import 'package:busslina_dart_lightweight_lib/busslina_dart_lightweight_lib.dart'
    as llib;

import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
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

class _TabContentState extends State<TabContent> {
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
  Widget build(BuildContext context) => Center(
        child: fllib.Label(
          widget.text,
          color: Colors.black,
        ),
      );
}
