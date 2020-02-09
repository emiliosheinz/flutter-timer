formatToTimerString(Stopwatch stopwatch) {
  return Duration(milliseconds: stopwatch.elapsedMilliseconds)
      .toString()
      .substring(2, 10)
      .replaceAll('.', ',');
}
