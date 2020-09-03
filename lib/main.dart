import 'package:flutter/material.dart';
import 'package:instagram/main_page.dart';

import 'constants/material_white_color.dart';

void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(
        primarySwatch: white
      )
    );
  }
}
