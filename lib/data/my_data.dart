String API_key = "311451130c5f7a7dbf1cf676158e0a14";

int getweather(int c) {
  if (c >= 200 && c <= 232) {
    return 1;
  } else if (c >= 500 && c <= 531) {
    return 2;
  } else if (c >= 600 && c <= 622) {
    return 4;
  } else if (c == 800) {
    return 6;
  } else if (c == 801) {
    return 7;
  } else if (c >= 802 && c <= 804) {
    return 8;
  } else if (c >= 300 && c <= 321) {
    return 5;
  }
  return 9;
}

String getGreet(DateTime dt) {
  String greet = "";
  if (dt.hour <= 12) {
    greet = "Good Morning";
  } else if (dt.hour >= 12 && dt.hour <= 16) {
    greet = "Good Afternoon";
  } else {
    greet = "Good Evening";
  }
  return greet;
}
