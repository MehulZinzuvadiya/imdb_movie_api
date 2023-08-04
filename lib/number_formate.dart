import 'package:intl/intl.dart';

void main() {
  var longnum = 100500064965849;
  var num = 248000;
  var longnum2 = 68542216;

  NumberFormat myFormat = NumberFormat.currency(
    decimalDigits: 2,
    locale: 'en_IN',
    symbol: "₹",
  );
  print(myFormat.format(longnum));
  print(myFormat.format(num));
  print(myFormat.format(longnum2));
}
