class DateDart extends DateTime {
  DateDart.now() : super.now();

  DateDart.fromDateTime(DateTime datetime)
      : super(
            datetime.year,
            datetime.month,
            datetime.day,
            datetime.hour,
            datetime.minute,
            datetime.second,
            datetime.millisecond,
            datetime.microsecond);

  DateDart setHour(int h) {
    final diff = h - this.hour;
    if (diff > 0) {
      return DateDart.fromDateTime(this.add(Duration(hours: diff)));
    } else if (diff < 0) {
      return DateDart.fromDateTime(this.subtract(Duration(hours: -diff)));
    }
    return this;
  }

  DateDart setMinute(int m) {
    final diff = m - this.minute;
    if (diff > 0) {
      return DateDart.fromDateTime(this.add(Duration(minutes: diff)));
    } else if (diff < 0) {
      return DateDart.fromDateTime(this.subtract(Duration(minutes: -diff)));
    }
    return this;
  }

  DateDart setSecond(int s) {
    final diff = s - this.second;
    if (diff > 0) {
      return DateDart.fromDateTime(this.add(Duration(seconds: diff)));
    } else if (diff < 0) {
      return DateDart.fromDateTime(this.subtract(Duration(seconds: -diff)));
    }
    return this;
  }
}
