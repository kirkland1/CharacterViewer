import 'Icon.dart';

class RelatedTopics {
  RelatedTopics({
      required this.firstURL,
      required this.icon,
      required this.result,
      required this.text});

  RelatedTopics.fromJson(dynamic json) {
    firstURL = json['FirstURL'];
    icon = (json['Icon'] != null ? Icon.fromJson(json['Icon']) : null)!;
    result = json['Result'];
    text = json['Text'];
  }
  late String firstURL;
  late Icon? icon;
  late String result;
  late String text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FirstURL'] = firstURL;
    if (icon != null) {
      map['Icon'] = icon?.toJson();
    }
    map['Result'] = result;
    map['Text'] = text;
    return map;
  }

}