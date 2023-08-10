class Maintainer {
  Maintainer({
      required this.github});

  Maintainer.fromJson(dynamic json) {
    github = json['github'];
  }
  late String github;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['github'] = github;
    return map;
  }

}