import 'package:flutter/material.dart';

class InputClearIcon extends StatelessWidget {
  const InputClearIcon({
    Key? key,
    required this.showClearIcon,
    required this.onClearInput,
  }) : super(key: key);

  final bool showClearIcon;
  final Function onClearInput;

  @override
  Widget build(BuildContext context) {
    return !showClearIcon
        ? Container()
        : Container(
            height: 20.0,
            margin: const EdgeInsets.only(
              left: 8.0,
              bottom: 5.0,
            ),
            child: IconButton(
              padding: const EdgeInsets.only(bottom: 10),
              icon: Icon(
                Icons.delete,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: onClearInput as void Function()?,
            ),
          );
  }
}
