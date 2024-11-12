extension DateStringX on String {
  String get toShortDate {
    DateTime d = DateTime.parse(this);

    return "${d.day}/${d.month}/${d.year}";
  }
}
