formatToTimerString(int ms) {
  return Duration(milliseconds: ms)
      .toString()
      .substring(2, 10)
      .replaceAll('.', ',');
}
