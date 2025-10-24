import 'package:flutter/material.dart';
import 'widgets/search/features.dart';
import 'widgets/filter_list/features.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Text('Hello World'), SearchDemoPage(), FilterListDemoPage()],
    );
  }
}
