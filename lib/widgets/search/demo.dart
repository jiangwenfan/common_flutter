// 演示
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'core.dart';

class SearchDemoPage extends HookWidget {
  const SearchDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final inputText = useState('');
    return Column(
      children: [
        CSearch(
          onChanged: (value) {
            print("--$value");
            inputText.value = value;
          },
        ),

        Text(inputText.value),
      ],
    );
  }
}
