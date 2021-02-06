
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Speech extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Speech')),
        body: Center(
          child: MyStatefulWidget(),)
      )
    );
  }
}

class MyStatefulWidget extends StatefulWidget{
  @override
  _MyStatefulWidget createState() => _MyStatefulWidget();
}

class _MyStatefulWidget extends State<MyStatefulWidget>{
  @override
  Widget build(BuildContext context){
    
  }
}