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
        headerCellBuilder: (columnIndex) =>
            const fllib.TableHeaderCell(value: 'Hey'),
        cellBuilder: (columnIndex, rowIndex) => fllib.TableBodyCell(
          value: columnIndex == 1
              ? 'Heyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
              : 'Hey',
        ),
        selectable: true,
      );
}
