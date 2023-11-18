import 'package:busslina_dart_lightweight_lib/busslina_dart_lightweight_lib.dart'
    as llib;
import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageThree extends ConsumerStatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  ConsumerState<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends ConsumerState<PageThree> {
  int _subpageSelected = 0;

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
            body: Column(
          children: [
            const fllib.Label(
              'Hey',
              color: Colors.red,
            ),

            // Subpage selecter
            _SubPageSelector(
              currentSubPageIndex: _subpageSelected,
              onIndexChanged: _changeSubPage,
            ),

            // Suppage
            Expanded(
                child: _SubPage(
              key: Key(_subpageSelected.toString()),
              text: 'Subpage ${_subpageSelected + 1}',
            ))
          ],
        )),
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

  const _SubPageSelector({
    required this.currentSubPageIndex,
    required this.onIndexChanged,
  });

  @override
  State<StatefulWidget> createState() => _SubPageSelectorState();
}

class _SubPageSelectorState extends State<_SubPageSelector> {
  @override
  Widget build(BuildContext context) => Row(
        children: [
          // Previous page button
          _buildButton('Previous',
              widget.currentSubPageIndex == 0 ? null : _previousPage),

          // Current page label
          fllib.Label('Subpage ${widget.currentSubPageIndex + 1}'),

          // Next page button
          _buildButton(
              'Next', widget.currentSubPageIndex == 4 ? null : _nextPage),
        ],
      ).sized(height: 50);

  Widget _buildButton(String text, VoidCallback? onPressed) =>
      ElevatedButton(onPressed: onPressed, child: fllib.Label(text));

  void _previousPage() => widget.onIndexChanged(widget.currentSubPageIndex - 1);
  void _nextPage() => widget.onIndexChanged(widget.currentSubPageIndex + 1);
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

class _SubPageState extends State<_SubPage> with AutomaticKeepAliveClientMixin {
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
