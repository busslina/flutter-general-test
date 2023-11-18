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
  int _subpageSelected = 0;
  int _maxSubpages = 5;

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Return button
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(currentPageProvider.notifier)
                        .changePage(const PageOne());
                  },
                  child: const Icon(Icons.keyboard_return),
                ),

                // Add subpage button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _maxSubpages++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),

                // Subpage selector
                _SubPageSelector(
                  currentSubPageIndex: _subpageSelected,
                  onIndexChanged: _changeSubPage,
                  maxSubpages: _maxSubpages,
                ),

                // Subpage
                Expanded(
                    child: IndexedStack(
                  index: _subpageSelected,
                  children: [
                    for (int i = 0; i < _maxSubpages; i++)
                      _SubPage(
                        key: Key(i.toString()),
                        text: 'Subpage ${i + 1}',
                      ),
                  ],
                ))
              ],
            ),
          ),
        ),
      );

  void _changeSubPage(int index) {
    if (_subpageSelected == index) {
      return;
    }

    setState(() {
      _subpageSelected = index;
    });
  }
}

class _SubPageSelector extends StatefulWidget {
  final int currentSubPageIndex;
  final Function(int index) onIndexChanged;
  final int maxSubpages;

  const _SubPageSelector({
    required this.currentSubPageIndex,
    required this.onIndexChanged,
    required this.maxSubpages,
  });

  @override
  State<StatefulWidget> createState() => _SubPageSelectorState();
}

class _SubPageSelectorState extends State<_SubPageSelector> {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Previous page button
          _buildButton('Previous',
              widget.currentSubPageIndex == 0 ? null : _previousSubPage),

          // Current page label
          fllib.Label('Subpage ${widget.currentSubPageIndex + 1}'),

          // Next page button
          _buildButton(
              'Next',
              widget.currentSubPageIndex < widget.maxSubpages - 1
                  ? _nextSubPage
                  : null),
        ],
      ).sized(height: 50);

  Widget _buildButton(String text, VoidCallback? onPressed) => ElevatedButton(
        onPressed: onPressed,
        child: fllib.Label(text),
      ).sized(width: 100);

  void _previousSubPage() =>
      widget.onIndexChanged(widget.currentSubPageIndex - 1);
  void _nextSubPage() => widget.onIndexChanged(widget.currentSubPageIndex + 1);
}

class _SubPage extends StatefulWidget {
  final String text;

  const _SubPage({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<_SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<_SubPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    llib.debug('_SubPageState.initState() -- ${widget.text}');
  }

  @override
  void dispose() {
    llib.debug('_SubPageState.dispose() -- ${widget.text}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          fllib.Label(
            widget.text,
            color: Colors.black,
            fontSize: 20,
          ),

          // Counter text
          fllib.Label(
            'Counter: $_counter',
            color: Colors.black,
          ).marginTop(15),

          // Counter button
          ElevatedButton(
            onPressed: () {
              setState(() => _counter++);
            },
            child: const Icon(Icons.add),
          ).sized(width: 100, height: 40).marginTop(15),
        ],
      ),
    );
  }
}
