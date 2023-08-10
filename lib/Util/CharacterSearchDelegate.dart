import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:character_viewer/Data/RelatedTopics.dart';
import '../Config/globals.dart' as globals;

class CharacterSearchDelegate extends SearchDelegate {
  List<RelatedTopics> list;
  final VoidCallback callbackFunction;
  late HashMap<String, RelatedTopics> mapRelatedTopics = HashMap();
  late BuildContext context;

  CharacterSearchDelegate(List<RelatedTopics> this.list, VoidCallback this.callbackFunction);

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          globals.searchRelatedTopics.clear();
          close(context, null);
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        print("query: $query");
        mapRelatedTopics.forEach((key, value) {
          if (key.toLowerCase().contains(query) || value.text.toString().toLowerCase().contains(query)) {
            globals.searchRelatedTopics.add(value);
          }

        });
        //globals.searchRelatedTopics.addAll(mapRelatedTopics.values.toList());
        callbackFunction();
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    this.context = context;
    List<String> matchQuery = [];
    for (var listItem in list) {
      if (listItem.text.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(listItem.text.split("-")[0]);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {

          },
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var listItem in list) {
      if (listItem.text.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(listItem.text.split("-")[0]);
        mapRelatedTopics.putIfAbsent(listItem.text.split("-")[0], () => listItem);
        //globals.searchRelatedTopics.add(listItem);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
