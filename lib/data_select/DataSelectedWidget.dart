import 'package:flutter/cupertino.dart';

import 'data_interface.dart';

class DateSelectWidget extends StatefulWidget {
  final double itemHeight;
  final DateInterface _date;

  DateSelectWidget(this.itemHeight, this._date);

  @override
  _DateSelectWidgetState createState() => _DateSelectWidgetState();
}

class _DateSelectWidgetState extends State<DateSelectWidget> {
  int mYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.itemHeight * 5,
      child: ListView.builder(
        itemExtent: widget.itemHeight,
      ),
    );
  }
}
