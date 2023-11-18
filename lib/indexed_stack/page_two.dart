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
                      _subpages.add(_subpages.length);
                    });
                  },
                  child: const Icon(Icons.add),
                ).marginTop(15),

                // Subpages count text
                fllib.Label(
                  'Subpages: ${_subpages.length}',
                  color: Colors.black,
                ).marginTop(10),

                // Subpage selector
                _SubPageSelector(
                  currentSubPageIndex: _subpageSelected,
                  onIndexChanged: _changeSelectedSubpage,
                  subpagesCount: _subpages.length,
                ).marginTop(20),

                // Subpage shifter
                ElevatedButton(
                    onPressed: _shuffleSubpages,
                    child: const fllib.Label(
                      'Shuffle subpages',
                      color: Colors.black,
                    )).marginTop(10),
                // Subpage
                Expanded(
                    child: IndexedStack(
                  index: _subpageSelected,
                  children: [
                    for (final index in _subpages)
                      _SubPage(
                        key: Key(index.toString()),
                        text: 'Subpage ${index + 1}',
                      ),
                  ],
                ))
              ],
            ),
          ),
        ),
      );

  void _changeSelectedSubpage(int index) {
    if (_subpageSelected == index) {
      return;
    }

    setState(() {
      _subpageSelected = index;
    });
  }

  void _shuffleSubpages() {
    setState(() {
      _subpages.shuffle();
    });
  }
}

class _SubPageSelector extends StatelessWidget {
  final int currentSubPageIndex;
  final Function(int index) onIndexChanged;
  final int subpagesCount;

  const _SubPageSelector({
    required this.currentSubPageIndex,
    required this.onIndexChanged,
    required this.subpagesCount,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Previous subpage button
          _buildButton(
              'Previous', currentSubPageIndex == 0 ? null : _previousSubPage),

          // Current page label
          fllib.Label('Subpage ${currentSubPageIndex + 1}'),

          // Next subpage button
          _buildButton('Next',
              currentSubPageIndex < subpagesCount - 1 ? _nextSubPage : null),
        ],
      ).sized(height: 50);

  Widget _buildButton(String text, VoidCallback? onPressed) => ElevatedButton(
        onPressed: onPressed,
        child: fllib.Label(text),
      ).sized(width: 100);

  void _previousSubPage() => onIndexChanged(currentSubPageIndex - 1);
  void _nextSubPage() => onIndexChanged(currentSubPageIndex + 1);
}

// class _SubPageShifter extends StatelessWidget {
//   final int currentSubPageIndex;
//   final Function(int indexA, int indexB) onShiftRequest;
//   final int subpagesCount;

//   const _SubPageShifter({
//     required this.currentSubPageIndex,
//     required this.onShiftRequest,
//     required this.subpagesCount,
//   });

//   @override
//   Widget build(BuildContext context) => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Shift with previous subpage button
//           _buildButton('Shift with previous',
//               currentSubPageIndex == 0 ? null : _shiftWithPreviousSubPage),

//           // Shift with next subpage button
//           _buildButton(
//               'Shift with next',
//               currentSubPageIndex < subpagesCount - 1
//                   ? _shoftWithNextSubPage
//                   : null),
//         ],
//       ).sized(height: 50);

//   Widget _buildButton(String text, VoidCallback? onPressed) => ElevatedButton(
//         onPressed: onPressed,
//         child: fllib.Label(text),
//       ).sized(width: 150);

//   void _shiftWithPreviousSubPage() =>
//       onShiftRequest(currentSubPageIndex, currentSubPageIndex - 1);
//   void _shoftWithNextSubPage() =>
//       onShiftRequest(currentSubPageIndex, currentSubPageIndex + 1);
// }

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
