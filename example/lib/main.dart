import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_promotion/flutter_promotion.dart';

void main() async {
  await FlutterPromotion().setPromotion(prefer: 120, max: 120);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  String lorem = '''
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'
  ''';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: [
            RaisedButton(
                child: Text('60'),
                padding: EdgeInsets.zero, onPressed: () async{
              bool? result = await FlutterPromotion().setPromotion(prefer: 60, max: 60);
              debugPrint('result = ${result}');
            }),
            RaisedButton(
                child: Text('120'),
                padding: EdgeInsets.zero, onPressed: () async{
              bool? result = await FlutterPromotion().setPromotion(prefer: 120, max: 120);
              debugPrint('result = ${result}');
            }),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate(
              List.generate(
                  100,
                  (index) => Container(
                        height: 100,
                        width: 100,
                        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                        child: Text(lorem),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
