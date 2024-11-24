import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

extension ExtendedWidget on Widget {
  Widget addPadding(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget addMargin(EdgeInsets padding) {
    return Container(
      margin: padding,
      child: this,
    );
  }

  Widget addBorderRadius(BuildContext context,
      {margin = const EdgeInsets.all(0)}) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8.h),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: this,
    );
  }

  Widget addShadow({Offset? offset}) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 6,
          offset: offset ?? const Offset(0, 3), // changes position of shadow
        ),
      ]),
      child: this,
    );
  }
}

// To remove HTML Extensions
// extension HtmlTagRemover on String {
//   String removeHtmlTags() {
//     final pattern = RegExp(r'<(?!\/?(ul|li|strong)\b)[^>]*>', multiLine: true);
//     return this.replaceAll(pattern, '');
//   }
// }
extension HtmlTagRemover on String {
  String removeHtmlTags() {
    final pattern =
        RegExp(r'<(?!\/?(ul|li|strong|p)\b)[^>]*>', multiLine: true);
    return replaceAll(pattern, '');
  }
}

// To remove HTML Extensions and crop the length
extension HtmlTagRemoverWithInt on String {
  String removeHtmlTagsAndTruncate(int length) {
    final pattern = RegExp(r'<(?!\/?(ul|li|strong)\b)[^>]*>', multiLine: true);
    String result = replaceAll(pattern, '');
    if (result.length > length) {
      result = '${result.substring(0, length)} , See More ....';
    }
    return result;
  }
}

extension ExtendedInputBorder on Border {
  OutlineInputBorder inputOutlineBorderDecoration({context}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).brightness == Brightness.light
            ? const Color(0xffBDBDBD)
            : const Color(0xff9F9F9F),
      ),
      borderRadius: BorderRadius.circular(6.h),
    );
  }
}

String smartDateTimeFormat(
  String? dateString, {
  bool isUtc = true,
  DateFormat? dateFormat,
}) {
  if (dateString == null || dateString.isEmpty) {
    return '';
  }
  // parse UTC Date
  if (isUtc && !dateString.endsWith('Z')) dateString = '${dateString}Z';

  var date = DateTime.parse(dateString);

  var today = DateTime.now();
  if (dateFormat != null) {
    return dateFormat.format(date.toLocal());
  } else {
    if (date.day == today.day) {
      var format = 'hh:mm a';
      return "Today at ${DateFormat(format).format(date.toLocal())}";
    } else if (today.day - 1 == date.day) {
      var format = 'hh:mm a';
      return "Yesterday at ${DateFormat(format).format(date.toLocal())}";
    } else {
      var format = "dd MMMM "; //dd MMMM hh:mm a
      return DateFormat(format).format(date.toLocal());
    }
  }
}
