class SrcOptions {
  SrcOptions(
      [this.directory = '',
      this.isFanon = 0,
      this.isMediawiki = 0,
      this.isWikipedia = 0,
      this.language = '',
      this.minAbstractLength = '',
      this.skipAbstract = 0,
      this.skipAbstractParen = 0,
      this.skipEnd = '',
      this.skipIcon = 0,
      this.skipImageName = 0,
      this.skipQr = '',
      this.sourceSkip = '',
      this.srcInfo = '']);

  SrcOptions.fromJson(dynamic json) {
    directory = json['directory'];
    isFanon = json['is_fanon'];
    isMediawiki = json['is_mediawiki'];
    isWikipedia = json['is_wikipedia'];
    language = json['language'];
    minAbstractLength = json['min_abstract_length'];
    skipAbstract = json['skip_abstract'];
    skipAbstractParen = json['skip_abstract_paren'];
    skipEnd = json['skip_end'];
    skipIcon = json['skip_icon'];
    skipImageName = json['skip_image_name'];
    skipQr = json['skip_qr'];
    sourceSkip = json['source_skip'];
    srcInfo = json['src_info'];
  }

  late String directory;
  late int isFanon;
  late int isMediawiki;
  late int isWikipedia;
  late String language;
  late String minAbstractLength;
  late int skipAbstract;
  late int skipAbstractParen;
  late String skipEnd;
  late int skipIcon;
  late int skipImageName;
  late String skipQr;
  late String sourceSkip;
  late String srcInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['directory'] = directory;
    map['is_fanon'] = isFanon;
    map['is_mediawiki'] = isMediawiki;
    map['is_wikipedia'] = isWikipedia;
    map['language'] = language;
    map['min_abstract_length'] = minAbstractLength;
    map['skip_abstract'] = skipAbstract;
    map['skip_abstract_paren'] = skipAbstractParen;
    map['skip_end'] = skipEnd;
    map['skip_icon'] = skipIcon;
    map['skip_image_name'] = skipImageName;
    map['skip_qr'] = skipQr;
    map['source_skip'] = sourceSkip;
    map['src_info'] = srcInfo;
    return map;
  }
}
