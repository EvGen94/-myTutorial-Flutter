import 'package:flutter/material.dart';
import './ChildList.dart';

class ChildScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("NewScrenn"),) ,
      body: ChildList(),
    );
  }
}
