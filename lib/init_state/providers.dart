import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'page_one.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
class CurrentPage extends _$CurrentPage {
  @override
  Widget build() => const PageOne();

  changePage(Widget newPage) => state = newPage;
}
