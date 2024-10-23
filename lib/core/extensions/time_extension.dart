import '../constants/env_strings.dart';

extension DateTimeFormatter on DateTime {
  String toCustomFormat() {
    final months = [
      '', // Leave an empty string at index 0 to align with month numbering
      AlbumString.jan,
      AlbumString.feb,
      AlbumString.mar,
      AlbumString.apr,
      AlbumString.may,
      AlbumString.jun,
      AlbumString.jul,
      AlbumString.aug,
      AlbumString.sep,
      AlbumString.oct,
      AlbumString.nov,
      AlbumString.dec,
    ];

    final month = months[this.month];
    final day = this.day.toString().padLeft(2, '0');
    final year = this.year.toString();

    return '$month $day, $year';
  }
}


/// You can use this extension thus ==>
// void main() {
//   final now = DateTime.now();
//   final formattedDate = now.toCustomFormat();
//   print(formattedDate);
// }