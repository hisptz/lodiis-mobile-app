import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_icon.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class DateInputFieldContainer extends StatefulWidget {
  const DateInputFieldContainer({
    Key key,
    @required this.inputField,
    @required this.onInputValueChange,
    @required this.currentLanguage,
    this.inputValue,
  }) : super(key: key);
  final InputField inputField;
  final Function onInputValueChange;
  final String currentLanguage;
  final String inputValue;

  @override
  _DateInputFieldContainerState createState() =>
      _DateInputFieldContainerState();
}

class _DateInputFieldContainerState extends State<DateInputFieldContainer> {
  TextEditingController dateController;

  String _date;

  @override
  void initState() {
    super.initState();
    setState(() {
      _date = widget.inputValue == '' ? null : widget.inputValue;
      dateController = TextEditingController(text: _date);
    });
  }

  DateTime getDateFromGivenYear(int year) {
    DateTime currentDate = DateTime.now();
    return new DateTime(
      currentDate.year - year,
      currentDate.month,
      currentDate.day - 1,
    );
  }

  void onOpenDateSelection(BuildContext context) async {
    int limit = 200;
    int minAgeInYear = widget.inputField.minAgeInYear ?? limit;
    int maxAgeInYear = widget.inputField.maxAgeInYear ?? -limit;
    DateTime lastDate = getDateFromGivenYear(
        widget.inputField.minAgeInYear != null ? minAgeInYear : -limit);
    DateTime firstDate = getDateFromGivenYear(
        widget.inputField.maxAgeInYear != null ? maxAgeInYear : limit);
    DateTime currentDate = DateTime.now();
    int numberOfYearBetweenCurrentAndMaxDate = currentDate.year - lastDate.year;
    _date = _date ??
        AppUtil.formattedDateTimeIntoString(
          numberOfYearBetweenCurrentAndMaxDate >= 0 ? lastDate : currentDate,
        );
    DateTime date = await showDatePicker(
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: widget.inputField.inputColor,
            ),
          ),
          child: child,
        );
      },
      context: context,
      fieldLabelText: widget.currentLanguage == 'lesotho'
          ? '${widget.inputField.translatedName}'
          : '${widget.inputField.name}',
      initialDate: AppUtil.getDateIntoDateTimeFormat(_date),
      firstDate: firstDate,
      confirmText: widget.currentLanguage == 'lesotho' ? 'Ok' : 'Ok',
      cancelText: widget.currentLanguage == 'lesotho' ? 'Cancel' : 'Cancel',
      lastDate: widget.inputField.allowFuturePeriod ||
              numberOfYearBetweenCurrentAndMaxDate >= 0
          ? lastDate
          : DateTime.now(),
      helpText: widget.inputField.hint != null
          ? widget.currentLanguage == 'lesotho' &&
                  widget.inputField.translatedHint != null
              ? widget.inputField.translatedHint
              : widget.inputField.hint
          : widget.currentLanguage == 'lesotho' &&
                  widget.inputField.translatedName != null
              ? '${widget.inputField.translatedName}'
              : '${widget.inputField.name}',
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
              style: TextStyle().copyWith(
                color: widget.inputField.inputColor,
              ),
              onTap: () => onOpenDateSelection(context),
              readOnly: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: InputBorder.none,
                errorText: null,
              ),
            ),
          ),
          InputCheckedIcon(
            showTickedIcon: _date != null,
            color: widget.inputField.inputColor,
          )
        ],
      ),
    );
  }
}
