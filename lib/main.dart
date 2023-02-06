import 'package:flutter/material.dart';
import 'package:google_map/screen/permission.dart';
import 'package:google_map/screen/simpleMap.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RunTimePer(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
