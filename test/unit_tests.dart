

import 'dart:io';

import 'package:character_viewer/MainDelegates/character_viewer_app.dart';
import 'package:character_viewer/Util/CharacterSearchDelegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:test/test.dart';
import 'package:character_viewer/Config/constants.dart';
import 'package:character_viewer/Util/CharacterSearchDelegate.dart';
import 'package:character_viewer/Data/RelatedTopics.dart';
import 'package:character_viewer/Config/globals.dart' as globals;
import 'package:character_viewer/Data/character_data.dart';
import 'package:character_viewer/Screens/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  Future<CharacterData> getDataFromSimpsonsAPI() async {
    Constants.setEnvironment(Environment.SIMPSONS);
    print("Constants.DATAAPI: ${Constants.DATAAPI}");
    Uri uri = Uri.parse(Constants.DATAAPI);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      // All ok
      CharacterData characterData = characterDataFromJson(response.body);
      return characterData;
    } else {
      var errorMessage = '${response.statusCode}: ${response.body} ';
      print("Error: $errorMessage");
      return CharacterData();
    }
  }

  void searchDone() {
    print("callback called");
    print("searchedRelatedTopics: ${globals.searchRelatedTopics.length}");
  }

  test('Search a character', () async {
    WidgetsFlutterBinding.ensureInitialized();
    Constants.setEnvironment(Environment.SIMPSONS);
    const CharacterViewerApp();
    print("Context: ${globals.searchContext}");
    CharacterData characterData = await getDataFromSimpsonsAPI();
    final list = List<RelatedTopics>.from(characterData.relatedTopics!);
    CharacterSearchDelegate characterSearchDelegate = CharacterSearchDelegate(list, searchDone);
    characterSearchDelegate.query = 'Homer';
    characterSearchDelegate.buildLeading(globals.searchContext!);
    characterSearchDelegate.buildSuggestions(globals.searchContext!);

    print("counter: ${globals.searchRelatedTopics.length}");
    expect(globals.searchRelatedTopics.length, 1);
  });

}
