import 'package:busslina_flutter_lightweight_lib/busslina_flutter_lightweight_lib.dart'
    as fllib;
    
import 'package:flutter/material.dart';

class PageTable extends StatelessWidget {
  const PageTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => fllib.BusslinaTable(
        columnLength: 4,
        rowLength: 100,
        headerCellBuilder: (columnIndex) =>
            const fllib.Label('Hey').bgColor(Colors.red).centered(),
        cellBuilder: (columnIndex, rowIndex) =>
            fllib.Label('Hey $columnIndex $rowIndex')
                .bgColor(Colors.blue)
                .centered(),
      );
}
