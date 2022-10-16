class ClockModel {

  late int hour;
  late int minute;
  late int second;
  late bool is24HourFormat;

  get is24HourTimeFormat => is24HourFormat;
}

hTOhh_24hTrue(int hour) {
  late String sHour;
  if (hour < 10) {
    sHour = "0$hour";
  } else {
    sHour = "$hour";
  }
  return sHour;
}

hTOhh_24hFalse(int hour) {
  late String sHour;
  late String h12State;
  var times = [];
  if (hour < 10) {
    sHour = "0$hour";
    h12State = "AM";
  } else if (hour > 9 && hour < 13) {
    sHour = "$hour";
    h12State = "AM";
  } else if (hour > 12 && hour < 22) {
    sHour = "0${hour % 12}";
    h12State = "PM";
  } else if (hour > 21) {
    sHour = "${hour % 12}";
    h12State = "PM";
  }
  times.add(sHour);
  times.add(h12State);
  return times;
}

mTOmm(int minute) {
  late String sMinute;
  if (minute < 10) {
    sMinute = "0$minute";
  } else {
    sMinute = "$minute";
  }
  return sMinute;
}

sTOss(int second) {
  late String sSecond;
  if (second < 10) {
    sSecond = "0$second";
  } else {
    sSecond = "$second";
  }
  return sSecond;
}
