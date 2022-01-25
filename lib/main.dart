import 'package:flutter/material.dart';
import 'package:flutter_application_1/countPage.dart';
import 'package:flutter_application_1/providers.dart';
import 'package:flutter_application_1/textpage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(textProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      endDrawer: Drawer(
          child: ListView(
        children: <Widget>[
          SizedBox(
            width: 200,
            height: 50,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CountPage()));
                },
                child: const Text('ボタン1')),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TextPage()));
                },
                child: const Text('ボタン2')),
          )
        ],
      )),
      body: Center(
        child: Text(
          '$text',
          style: TextStyle(fontSize: 32, color: Theme.of(context).primaryColor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(countProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
