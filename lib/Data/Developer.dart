class Developer {
  Developer({
      required this.name,
      required this.type,
      required this.url});

  Developer.fromJson(dynamic json) {
    name = json['name'];
    type = json['type'];
    url = json['url'];
  }
  late String name;
  late String type;
  late String url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['type'] = type;
    map['url'] = url;
    return map;
  }

}