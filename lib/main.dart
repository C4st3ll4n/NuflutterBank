import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nubank/pages/home/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ));

    return MaterialApp(
	    debugShowCheckedModeBanner: false,
      title: 'NuClone',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: RootPage(),
    );
  }
}
