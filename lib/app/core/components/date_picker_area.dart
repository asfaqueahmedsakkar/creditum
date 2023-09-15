import 'package:creditum/app/core/components/input_container.dart';
import 'package:creditum/app/core/components/selectable_item.dart';
import 'package:creditum/app/core/extensions/date_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class DateTimePickerArea extends StatelessWidget {
  final String? label;
  final String? error;
  final String? hint;
  final bool? enabled;
  final DateTime? selectedDate;
  final Function(DateTime) onDatePick;

  const DateTimePickerArea({
    Key? key,
    this.label,
    this.error,
    this.hint,
    this.enabled,
    required this.onDatePick,
    this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        DateTime? time = await showOmniDateTimePicker(
          type: OmniDateTimePickerType.dateAndTime,
          context: Get.context!,
          is24HourMode: false,
          isShowSeconds: false,
          minutesInterval: 1,
          secondsInterval: 1,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          constraints: const BoxConstraints(maxWidth: 350, maxHeight: 650),
          transitionBuilder: (context, anim1, anim2, child) {
            return FadeTransition(
              opacity: anim1.drive(Tween(begin: 0, end: 1)),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
          barrierDismissible: true,
        );
        if (time != null) {
          onDatePick(time);
        }
      },
      child: InputContainer(
        label: label,
        error: error,
        disablePadding: true,
        enabled: enabled ?? true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  getTextContent(),
                  style: getTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.calendar_month_sharp,
                  size: 16,
                  color: enabled != false ? Colors.black : Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle getTextStyle() {
    TextStyle style = const TextStyle(
      fontSize: 16,
      letterSpacing: 0.2,
    );
    if (selectedDate == null) style = style.copyWith(color: Colors.grey[300]);
    return style;
  }

  String getTextContent() {
    return selectedDate?.toDateTimeString() ?? "Select ${label ?? "Date"}";
  }
}
