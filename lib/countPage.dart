import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountPage extends ConsumerWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Count Page')),
      body: Center(
        child: Text(
          'count is $count',
          style: TextStyle(fontSize: 32, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
