
/*
void debug(dynamic text, [dynamic t2, dynamic t3]) {
  String log =
      (text ?? '').toString() + (t2 ?? '').toString() + (t3 ?? '').toString();
  DateTime time = DateTime.now();

  if (text is DioError && text?.response?.data != null) {
    log += '\ntext.response.data: ${text.response.data}';
  }

  print('$time: $log');
  writeLog('$time: $log \n', 'log.txt').catchError(print);
}*/