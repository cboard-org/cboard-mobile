import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
// class DropDownSection extends StatefulWidget {
//   String title;
//   RichText subTitle;
//   var initialVal;
//   // Function(String) onchange;
//   List items;
//   Function onChange;

//   DropDownSection({
//     @required this.title,
//     @required this.subTitle,
//     @required this.initialVal,
//     @required this.items,
//     this.onChange,
//   });
//   @override
//   _DropDownSection createState() => _DropDownSection(
//       title: title,
//       subTitle: subTitle,
//       initialVal: initialVal,
//       items: items,
//       onChange: onChange);
// }

class DropDownSection extends StatelessWidget {
  String title;
  RichText subTitle;
  var initialVal;
  // Function(String) onchange;
  List items;
  Function onChange;
  DropDownSection(
      {@required this.title,
      @required this.subTitle,
      @required this.initialVal,
      @required this.items,
      this.onChange});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.title),
      subtitle: this.subTitle,
      trailing: DropdownButton(
          value: initialVal,
          elevation: 16,
          style: const TextStyle(
            color: dark_gray,
          ),
          underline: Container(
            height: 2,
            color: dark_gray,
          ),
          onChanged: onChange,
          items: items),
    );
  }
}
