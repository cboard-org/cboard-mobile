import 'package:flutter/material.dart';

class Display extends StatelessWidget{
 @override
 Widget build(BuildContext context){
  return MaterialApp(
      home:Scaffold(
         appBar: AppBar(
          centerTitle: true,
          title: Text('Settings'),
          backgroundColor: Color(0xff23036A),
        ),
        body: Center(
          child: MyStatefulWidget(),)
          ));
}}

enum size {Standard, Large, ExtraLarge}

class MyStatefulWidget extends StatefulWidget{
  MyStatefulWidget({Key key}) : super(key:key);
  @override
  _MyStatefulWidget createState() => _MyStatefulWidget();
  }

class _MyStatefulWidget extends State<MyStatefulWidget>{  
  bool _darkTheme = false;
  bool _predictiveText = false;
  bool _outputBar = false;
  size uiSize = size.Standard;
  size fontSize = size.Standard;

  @override
  Widget build(BuildContext context){
    return ListView(
          children: <Widget>[
           radio_section('UI Size', 'Elements Size',uiSize),
           Divider(height: 20, color: Color(0xffE0E0E0), thickness: 1,),
           radio_section('Font Size', 'App Font Size',fontSize),
           Divider(height: 20, color: Color(0xffE0E0E0), thickness: 1,),
           listTile_section('Enable Dark Theme', '...',_darkTheme),
           Divider(height: 20, color: Color(0xffE0E0E0), thickness: 1,),
           listTile_section('Enable Predictive Text', '...',_predictiveText),
           Divider(height: 20, color: Color(0xffE0E0E0), thickness: 1,),
           listTile_section('Hide the Output Bar', '...',_outputBar),
          ],
    );
  }
  
  Widget listTile_section(String title, String subtitle, bool state){
    return SwitchListTile(
      activeColor: Color(0xff5600E8),
      title: Text(title, style: TextStyle(fontSize: 14, color: Colors.black)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 12, color: Color(0xff7C7C7C))),
      value: state,
      onChanged: (bool newValue){
        setState(() {
          state = newValue;
        });
      },
    );
  }

  Widget _radio (size groupState, size state){
    return  Radio(
                  activeColor: Color(0xff5600E8),
                  value: state,
                  groupValue: groupState,
                  onChanged: (size newValue){
                    setState(() {
                      groupState = newValue;
                    });
                  },
                );
  }

  Widget radio_section (String title, String subtitle, size groupState){
     return Container(
       margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 14)),
                  Text(subtitle, style: TextStyle(fontSize: 12, color: Color(0xff7C7C7C))),
                  Row(children: [
                    Expanded(child: 
                    Column(
                      children:[
                      _radio(groupState, size.Standard),
                      Text("Standard", style: TextStyle(fontSize: 12, color:Color(0xff7C7C7C)))]
                    )),
                    Expanded(child: 
                    Column(
                      children:[
                       Radio(
                  activeColor: Color(0xff5600E8),
                  value: size.Large,
                  groupValue: groupState,
                  onChanged: (size newValue){
                    setState(() {
                      groupState = newValue;
                    });
                  },
                ),
                      Text("Large",style: TextStyle(fontSize: 12, color:Color(0xff7C7C7C)))]
                    )),
                    Expanded(child:
                    Column(
                      children:[
                     _radio(groupState, size.ExtraLarge),
                      Text("Extra large", style: TextStyle(fontSize: 12, color:Color(0xff7C7C7C)))]
                    )),
                  ],),
                ],)
            );
    }
  }