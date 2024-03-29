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
  final _subpages = [0];
  final _subpagesKeys = [GlobalKey()];

  @override
  Widget build(BuildContext context) {
    final List<Widget> subpagesWidgets = [];

    llib.newLine();

    final List<String> aa = [];

    aa.indexed;

    for (final (positionalIndex, index) in _subpages.indexed) {
      llib.debug(
          'Creating subpage widget -- Index: $index, Key: ${_subpagesKeys[positionalIndex]}');

      subpagesWidgets.add(
        _SubPage(
          // key: _subpagesKeys[index],
          key: _subpagesKeys[positionalIndex],
          text: 'Subpage $index',
          position: _subpages.indexOf(_subpageSelected),
        ),
      );
    }

    llib.newLine();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 125),
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
              onPressed: _addSubpage,
              child: const Icon(Icons.add),
            ).marginTop(15),

            // Add subpage button (before current)
            ElevatedButton(
              onPressed: _addSubpageBeforeCurrent,
              child: const fllib.Label(
                'Insert before current',
                color: Colors.black,
              ),
            ).marginTop(15),

            // Subpages count text
            fllib.Label(
              'Subpages: ${_subpages.length}',
              color: Colors.black,
            ).marginTop(10),

            // Subpage selector
            _SubPageSelector(
              currentSubPageIndex: _subpageSelected,
              currentSubPagePosition: _subpages.indexOf(_subpageSelected),
              onIndexChanged: _changeSelectedSubpage,
              subpagesCount: _subpages.length,
            ).marginTop(20),

            // Shuffle button
            ElevatedButton(
                onPressed: _shuffleSubpages,
                child: const fllib.Label(
                  'Shuffle subpages',
                  color: Colors.black,
                )).marginTop(10),

            // Remove current button
            ElevatedButton(
              onPressed: _removeCurrentSubpage,
              child: const fllib.Label(
                'Remove current',
                color: Colors.black,
              ),
            ).marginTop(15),

            // Subpage
            Expanded(
                child: IndexedStack(
              index: _subpages.indexOf(_subpageSelected),
              children: subpagesWidgets,
            ))
          ],
        ),
      ),
    );
  }

  _addSubpage() {
    setState(() {
      _subpages.add(_subpages.length);
      _subpagesKeys.add(GlobalKey());
    });

    _debugLists('_addSubpage()');
  }

  _addSubpageBeforeCurrent() {
    setState(() {
      final index = _subpages.indexOf(_subpageSelected);
      _subpages.insert(index, _subpages.length);
      _subpagesKeys.insert(index, GlobalKey());
    });

    _debugLists('_addSubpageBeforeCurrent()');
  }

  _removeCurrentSubpage() {
    setState(() {
      final index = _subpages.indexOf(_subpageSelected);

      if (index == -1) {
        throw ('Error removing current subpage');
      }

      // final res = _subpages.remove(_subpageSelected);
      _subpages.removeAt(index);
      _subpagesKeys.removeAt(index);
    });

    _debugLists('_removeCurrentSubpage()');
  }

  void _changeSelectedSubpage(int position) {
    final newIndex = _subpages[position];

    if (_subpageSelected == newIndex) {
      return;
    }

    setState(() {
      _subpageSelected = newIndex;
    });
  }

  void _shuffleSubpages() {
    throw ('Not implemented for _subpagesKeys');

    // setState(() {
    //   _subpages.shuffle();
    //   llib.debug(_subpages);
    // });
  }

  _debugLists(String debugTab) {
    llib.debug('--- $debugTab ---', startFlagNL: true);

    llib.debug('Subpages: $_subpages');
    llib.debug('Subpages keys: $_subpagesKeys');

    llib.debug('--- $debugTab ---', endFlagNL: true);
  }
}

class _SubPageSelector extends StatelessWidget {
  final int currentSubPageIndex;
  final int currentSubPagePosition;
  final Function(int position) onIndexChanged;
  final int subpagesCount;

  const _SubPageSelector({
    required this.currentSubPageIndex,
    required this.currentSubPagePosition,
    required this.onIndexChanged,
    required this.subpagesCount,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Previous subpage button
          _buildButton('Previous',
              currentSubPagePosition == 0 ? null : _previousSubPage),

          // Current page label
          fllib.Label('Subpage $currentSubPageIndex'),

          // Next subpage button
          _buildButton('Next',
              currentSubPagePosition < subpagesCount - 1 ? _nextSubPage : null),
        ],
      ).sized(height: 50);

  Widget _buildButton(String text, VoidCallback? onPressed) => ElevatedButton(
        onPressed: onPressed,
        child: fllib.Label(text),
      ).sized(width: 100);

  void _previousSubPage() => onIndexChanged(currentSubPagePosition - 1);
  void _nextSubPage() => onIndexChanged(currentSubPagePosition + 1);
}

class _SubPage extends StatefulWidget {
  final String text;
  final int position;

  const _SubPage({
    Key? key,
    required this.text,
    required this.position,
  }) : super(key: key);

  @override
  State<_SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<_SubPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    llib.debug('_SubPageState.initState() -- ${widget.text} -- ${widget.key}');
  }

  @override
  void dispose() {
    llib.debug('_SubPageState.dispose() -- ${widget.text} -- ${widget.key}');
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

          // Position text
          fllib.Label(
            'Position: ${widget.position}',
            color: Colors.black,
          ).marginTop(15),

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
