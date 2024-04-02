import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/providers/count_provider.dart';

class MyCountPage extends StatelessWidget {
  const MyCountPage({super.key});

  @override
  Widget build(BuildContext context) {
    CountProvider state = Provider.of<CountProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("ChangeNotifierProvider Example"),
            const SizedBox(
              height: 20,
            ),
            Text("${state.counterValue}"),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: state.decrementCount,
                  icon: const Icon(Icons.remove),
                  color: Colors.red,
                ),
                Consumer<CountProvider>(builder: (context, value, child) {
                  return IconButton(
                    onPressed: value.incrementCount,
                    icon: const Icon(Icons.add),
                    color: Colors.green,
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
