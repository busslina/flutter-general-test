// import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
//     as fllib;

import 'package:flutter/material.dart';

class PageTable extends StatelessWidget {
  final Object tableProviderKey;

  const PageTable({
    Key? key,
    required this.tableProviderKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => throw ('Not implemented');
  // @override
  // Widget build(BuildContext context) => fllib.BusslinaTable(
  //       providerKey: 'myTable',
  //       columnLength: 4,
  //       rowLength: 100,
  //       headerCellBuilder: (columnIndex) => const fllib.Label(
  //         'Hey',
  //         fontSize: 22,
  //       ).centered(),
  //       cellBuilder: (columnIndex, rowIndex) => fllib.Label(
  //         'Hey $columnIndex $rowIndex',
  //         fontSize: 18,
  //         color: const Color.fromARGB(255, 76, 71, 51),
  //       ).centered(),
  //     );
}
