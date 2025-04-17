import 'package:flutter/material.dart';

class DioWidget extends StatelessWidget {
  const DioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ElevatedButton(onPressed: () {}, child: Text("Dio请求get"))],
    );
  }
}
