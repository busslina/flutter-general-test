import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;

import 'package:flutter/material.dart';

class PageTable extends StatelessWidget {
  final Object tableProviderKey;

  const PageTable({
    Key? key,
    required this.tableProviderKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => fllib.BusslinaTable(
        providerKey: 'myTable',
        columnLength: 4,
        rowLength: 100,
        // headerCellBuilder: ({columnIndex, row}) => ,
        headerCellBuilder: (fllib.TableHeaderRow row, int columnIndex) =>
            fllib.TableHeaderCell(row: row, value: 'Hey'),
        cellBuilder: (row, columnIndex) => fllib.TableBodyCell(
          row: row,
          value: columnIndex == 1
              ? 'Heyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
              : 'Hey',
          // bgColor: switch (columnIndex) {
          //   0 => Colors.blue,
          //   1 => Colors.orange,
          //   2 => Colors.green,
          //   3 => Colors.pink,
          //   _ => throw ('Bad usage'),
          // },
        ),
        selectable: true,
        columnFlexWidths: [3, 2, 2, 2],
      );
}
