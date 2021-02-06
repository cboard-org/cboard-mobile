import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Setting_wrapper extends StatelessWidget {
   final sections = ['People','Language','System','Help'];
   final List<Map<String,IconData>> icons = <Map<String,IconData>>[
     {'Guest':Icons.account_circle},
     {'Language':Icons.language,'Speech':Icons.record_voice_over},
     {'Export':Icons.cloud_upload,'Import':Icons.cloud_download,'Display':Icons.remove_red_eye,'Scanning':Icons.center_focus_strong,'Navigation':Icons.chevron_right},
     {'User Help':Icons.help,'About Cboard':Icons.info,'Donate':Icons.monetization_on,'Feedback':Icons.feedback}];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Settings'),
          backgroundColor: Color(0xff23036A),
        ),
      body: ListView.separated(  
         separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10,
                          );},
        itemCount: sections.length,      
        itemBuilder: (BuildContext context, int index){
            return Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                      ),
                    child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(sections[index],textAlign: TextAlign.left,),
                        ListView.separated(
                          separatorBuilder: 
                            (BuildContext context, int index) 
                              => Divider(color: Color(0xffE0E0E0), indent: 78),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: icons[index].length,
                          itemBuilder: (BuildContext context, int iconIndex) {
                            return ListTile(
                              leading: Icon(
                                icons[index].values.elementAt(iconIndex),
                                color: Color(0xff391E75),
                                size: 20,),
                              title: Text(
                                icons[index].keys.elementAt(iconIndex)),
                              trailing: (index==0)? 
                                          Container(
                                            width: 121,
                                            height: 27,
                                            alignment: Alignment.center,
                                            decoration: new BoxDecoration(
                                            border: Border.all(width: 1.0, color: const Color(0xff6200EE)),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(100.0)),
                                            child: Text('LOGIN/SIGN UP', style: TextStyle(color: Color(0xff391E75))),
                                          ):null ,
                            );
                          }
                        ),
            
                      ],)
          );
        },)
      ),
    );
  }
}