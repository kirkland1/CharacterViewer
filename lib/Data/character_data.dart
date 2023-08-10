import 'dart:convert';

import 'RelatedTopics.dart';
import 'Meta.dart';

CharacterData characterDataFromJson(String str) =>
    CharacterData.fromJson(json.decode(str));

class CharacterData {
  CharacterData(
      [this.abstract,
      this.abstractSource,
      this.abstractText,
      this.abstractURL,
      this.answer,
      this.answerType,
      this.definition,
      this.definitionSource,
      this.definitionURL,
      this.entity,
      this.heading,
      this.image,
      this.imageHeight,
      this.imageIsLogo,
      this.imageWidth,
      this.infobox,
      this.redirect,
      this.relatedTopics,
      this.results,
      this.type,
      this.meta]);

  CharacterData.fromJson(dynamic json) {
    abstract = json['Abstract'];
    abstractSource = json['AbstractSource'];
    abstractText = json['AbstractText'];
    abstractURL = json['AbstractURL'];
    answer = json['Answer'];
    answerType = json['AnswerType'];
    definition = json['Definition'];
    definitionSource = json['DefinitionSource'];
    definitionURL = json['DefinitionURL'];
    entity = json['Entity'];
    heading = json['Heading'];
    image = json['Image'];
    imageHeight = json['ImageHeight'];
    imageIsLogo = json['ImageIsLogo'];
    imageWidth = json['ImageWidth'];
    infobox = json['Infobox'];
    redirect = json['Redirect'];
    if (json['RelatedTopics'] != null) {
      relatedTopics = [];
      json['RelatedTopics'].forEach((v) {
        relatedTopics?.add(RelatedTopics.fromJson(v));
      });
    }
    if (json['Results'] != null) {
      results = [];
      json['Results'].forEach((v) {
        results?.add(v.toString());
      });
    }
    type = json['Type'];
    meta = (json['meta'] != null ? Meta.fromJson(json['meta']) : null)!;
  }

  late var abstract;
  late var abstractSource;
  late var abstractText;
  late var abstractURL;
  late var answer;
  late var answerType;
  late var definition;
  late var definitionSource;
  late var definitionURL;
  late var entity;
  late var heading;
  late var image;
  late var imageHeight;
  late var imageIsLogo;
  late var imageWidth;
  late var infobox;
  late var redirect;
  late List<RelatedTopics>? relatedTopics;
  late List<dynamic>? results;
  late var type;
  late Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Abstract'] = abstract;
    map['AbstractSource'] = abstractSource;
    map['AbstractText'] = abstractText;
    map['AbstractURL'] = abstractURL;
    map['Answer'] = answer;
    map['AnswerType'] = answerType;
    map['Definition'] = definition;
    map['DefinitionSource'] = definitionSource;
    map['DefinitionURL'] = definitionURL;
    map['Entity'] = entity;
    map['Heading'] = heading;
    map['Image'] = image;
    map['ImageHeight'] = imageHeight;
    map['ImageIsLogo'] = imageIsLogo;
    map['ImageWidth'] = imageWidth;
    map['Infobox'] = infobox;
    map['Redirect'] = redirect;
    if (relatedTopics != null) {
      map['RelatedTopics'] = relatedTopics?.map((v) => v.toJson()).toList();
    }
    if (results != null) {
      map['Results'] = results?.map((v) => v.toJson()).toList();
    }
    map['Type'] = type;
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }
}

class CharacterDatum {
  CharacterDatum(
      this.relatedTopics,
      );

  CharacterDatum.fromJson(dynamic json) {

    if (json['RelatedTopics'] != null) {
        relatedTopics = json['RelatedTopics'];
    }
  }

  late RelatedTopics? relatedTopics;

}
