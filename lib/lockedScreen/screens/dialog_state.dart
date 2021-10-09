import 'package:cboard_mobile/lockedScreen/widgets/edit_label.dart';
import 'package:cboard_mobile/lockedScreen/widgets/edit_label_size.dart';
import 'package:cboard_mobile/lockedScreen/widgets/edit_appearance.dart';
import 'package:cboard_mobile/models/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

//Navigate among different dialogs
class DialogState extends StatelessWidget {
  final String type;

  const DialogState({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dialogModel = Provider.of<DialogModel>(context);
    int state = dialogModel.currentState;
    if (state == 1) {
      return EditAppearance(type);
    } else if (state == 2) {
      return EditLabelSize(type: type);
    } else {
      return EditLabel(type: type);
    }
  }
}
