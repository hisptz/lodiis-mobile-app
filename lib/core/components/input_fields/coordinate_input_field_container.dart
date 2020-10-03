import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_icon.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class CoordinteInputFieldContainer extends StatefulWidget {
  const CoordinteInputFieldContainer(
      {Key key,
      @required this.inputField,
      @required this.onInputValueChange,
      this.inputValue})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;
  final String inputValue;

  @override
  _CoordinteInputFieldContainerState createState() =>
      _CoordinteInputFieldContainerState();
}

class _CoordinteInputFieldContainerState
    extends State<CoordinteInputFieldContainer> {
  String _longLatValue;
  bool isCoordinateSet = false;
  TextEditingController coordinateController;

  @override
  void initState() {
    super.initState();
    setCurrentLocation(widget.inputValue);
  }

  setCurrentLocation(String value) async {
    if (value == null) {
      Position currentPosition = await AppUtil.getCurrentLocation();
      value =
          '${currentPosition.longitude.toString()},${currentPosition.latitude.toString()}';
    }
    setState(() {
      _longLatValue = value.replaceAll('[', '').replaceAll(']', '');
      coordinateController = TextEditingController(text: _longLatValue);
      isCoordinateSet = true;
    });
    widget.onInputValueChange('[$value]');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: isCoordinateSet
                  ? TextFormField(
                      controller: coordinateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        errorText: null,
                      ))
                  : Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircularProcessLoader(
                        color: widget.inputField.inputColor,
                      ),
                    )),
          InputCheckedIcon(
            showTickedIcon: _longLatValue != null,
            color: widget.inputField.inputColor,
          )
        ],
      ),
    );
  }
}
