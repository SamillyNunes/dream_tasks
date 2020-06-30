import 'package:date_format/date_format.dart';

class Utils{

  static String formatDateTime(DateTime dateTime){
    return formatDate(dateTime, [dd, '-',mm,'-',yyyy]);
  }
}