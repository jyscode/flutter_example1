import 'package:example_1/screen/home_screen.dart';
import 'package:example_1/util/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: HomeScreen(),
        theme: CustomTheme.theme,
      ),
    ),
  );
}
