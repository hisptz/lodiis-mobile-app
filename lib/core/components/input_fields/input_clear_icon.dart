import 'package:flutter/material.dart';

class InputClearIcon extends StatelessWidget {
  const InputClearIcon({
    Key key,
    @required this.showClearIcon,
    @required this.onClearInput,
  }) : super(key: key);

  final bool showClearIcon;
  final Function onClearInput;

  @override
  Widget build(BuildContext context) {
    return !showClearIcon
        ? Container()
        : Container(
            height: 20.0,
            margin: EdgeInsets.only(left: 10, bottom: 5),
            child: IconButton(
              padding: EdgeInsets.only(bottom: 10),
              icon: Container(
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              onPressed: onClearInput,
            ),
          );
  }
}
