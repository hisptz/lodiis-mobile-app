import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_cion.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class DateInputFieldContainer extends StatefulWidget {
  const DateInputFieldContainer(
      {Key key,
      @required this.inputField,
      @required this.onInputValueChange,
      this.allowFuturePeriod = true})
      : super(key: key);
  final InputField inputField;
  final Function onInputValueChange;
  final bool allowFuturePeriod;

  @override
  _DateInputFieldContainerState createState() =>
      _DateInputFieldContainerState();
}

class _DateInputFieldContainerState extends State<DateInputFieldContainer> {
  TextEditingController dateController;
  Color valueColor = Color(0xFF182E35);
  String _date;

  @override
  void initState() {
    _date = widget.inputField.value;
    super.initState();
    dateController = TextEditingController(text: _date);
  }

  void onOpenDateSelection(BuildContext context) async {
    DateTime date = await showDatePicker(
      context: context,
      fieldLabelText: '${widget.inputField.name}',
      initialDate: AppUtil.getDateIntoDateTimeFormat(_date),
      firstDate: DateTime(1900),
      confirmText: 'Ok',
      cancelText: 'Cancel',
      lastDate: widget.allowFuturePeriod ? DateTime(2050) : DateTime.now(),
      helpText: '${widget.inputField.name}',
      errorFormatText: 'Enter valid ${widget.inputField.name}',
      errorInvalidText: 'Enter ${widget.inputField.name} in valid range',
    );

    if (date != null)
      setState(() {
        _date = AppUtil.formattedDateTimeIntoString(date);
        dateController = TextEditingController(text: _date);
        widget.onInputValueChange(_date);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                  controller: dateController,
                  style: TextStyle().copyWith(color: valueColor),
                  onTap: () => onOpenDateSelection(context),
                  readOnly: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorText: null,
                  ))),
          InputCheckedIcon(
            showTickedIcon: false,
            color: widget.inputField.color,
          )
        ],
      ),
    );
  }
}
