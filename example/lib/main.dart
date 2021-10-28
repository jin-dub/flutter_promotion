import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_promotion/flutter_promotion.dart';

void main() async{
  await FlutterPromotion().setPromotion(prefer: 120,max: 120);
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate(
              List.generate(
                  100,
                  (index) => AspectRatio(
                    aspectRatio: 1/1,
                    child: Image.network(
                        'https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png',fit: BoxFit.cover,),
                  )),
            ))
          ],
        ),
      ),
    );
  }
}
