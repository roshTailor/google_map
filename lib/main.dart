import 'package:flutter/material.dart';
import 'package:google_map/screen/simpleMap.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SimpleMap(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
