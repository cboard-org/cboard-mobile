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
  size _uiSize = size.Standard;
  size _fontSize = size.Standard;

  @override
  Widget build(BuildContext context){
    return ListView(
          children: <Widget>[
           radio_section('UI Size', 'Elements Size',_uiSize),
           Divider(height: 20, color: Color(0xffE0E0E0), thickness: 1,),
           radio_section('Font Size', 'App Font Size',_fontSize),
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
          if(title=="Enable Dark Theme")
            _darkTheme = newValue;
          else if(title == "Enable Predictive Text")
            _predictiveText = newValue;
          else _outputBar = newValue;
        });
      },
    );
  }

  Widget _radio (size groupState, size state, String title){
    return  Radio(
                  activeColor: Color(0xff5600E8),
                  value: state,
                  groupValue: groupState,
                  onChanged: (size newValue){
                    setState(() {
                      if(title == 'UI Size')
                        _uiSize = newValue;
                      else{
                        _fontSize = newValue;
                      }
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
                      _radio(groupState, size.Standard, title),
                      Text("Standard", style: TextStyle(fontSize: 12, color:Color(0xff7C7C7C)))]
                    )),
                    Expanded(child: 
                    Column(
                      children:[
                      _radio(groupState, size.Large, title),
                      Text("Large",style: TextStyle(fontSize: 12, color:Color(0xff7C7C7C)))]
                    )),
                    Expanded(child:
                    Column(
                      children:[
                     _radio(groupState, size.ExtraLarge, title),
                      Text("Extra large", style: TextStyle(fontSize: 12, color:Color(0xff7C7C7C)))]
                    )),
                  ],),
                ],)
            );
    }
  }