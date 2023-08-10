class Icon {
  Icon({
      required this.height,
      required this.url,
      required this.width,});

  Icon.fromJson(dynamic json) {
    height = json['Height'];
    url = json['URL'];
    width = json['Width'];
  }
  late String height;
  late String url;
  late String width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Height'] = height;
    map['URL'] = url;
    map['Width'] = width;
    return map;
  }

}