enum ImageEnums { door }

extension ImageEnumsExtension on ImageEnums {
  String get path => 'asset/images/ic_$name.png';
}
