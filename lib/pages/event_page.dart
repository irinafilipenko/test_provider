import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyEventPage extends StatelessWidget {
  const MyEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    int value = Provider.of<int>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("StreamProvider Example"),
        const SizedBox(
          height: 50,
        ),
        Text("$value")
      ],
    );
  }
}
