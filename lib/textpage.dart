import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextPage extends ConsumerWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(32),
              child: TextFormField(
                  onChanged: (value) =>
                      ref.read(textProvider.state).state = value,
                  decoration: const InputDecoration(labelText: 'テキスト'))),
          SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    '入力',
                    style: TextStyle(fontSize: 20),
                  )))
        ],
      ),
    );
  }
}
