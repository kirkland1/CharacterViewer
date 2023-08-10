import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:character_viewer/Data/RelatedTopics.dart';
import 'package:character_viewer/Screens/details_page.dart';
import '../Data/character_data.dart';
import '../Config/constants.dart';
import '../Util/CharacterSearchDelegate.dart';
import '../Config/globals.dart' as globals;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // For holding response as CharacterData
  late CharacterData characterData;
  // for data is loaded flag
  bool isDataLoaded = false;
  // error holding
  String errorMessage = '';
  late Orientation lorientation;
  late RelatedTopics relatedTopics;
  late bool isPhone = true;
  //late List<RelatedTopics> searchRelatedTopics = [];

  // API Call
  Future<CharacterData> getDataFromSimpsonsAPI() async {
    Uri uri = Uri.parse(Constants.DATAAPI);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      // All ok
      CharacterData characterData = characterDataFromJson(response.body);
      setState(() {
        isDataLoaded = true;
      });
      return characterData;
    } else {
      errorMessage = '${response.statusCode}: ${response.body} ';
      print("Error: $errorMessage");
      return CharacterData();
    }
  }

  callSimpsonAPIandAssignData() async {
    characterData = await getDataFromSimpsonsAPI();
    relatedTopics = characterData.relatedTopics![0];
  }

  void searchDone() {
    print("callback called");
    print("searchedRelatedTopics: ${globals.searchRelatedTopics.length}");
    setState(() {
      isDataLoaded = true;
    });
  }
  @override
  void initState() {
    isPhone = Device.get().isPhone;
    callSimpsonAPIandAssignData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    globals.searchContext = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Viewer'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              final result = await showSearch(
                  context: context,
                  delegate: CharacterSearchDelegate(characterData.relatedTopics!, searchDone));
              if (result != null) {
                setState(() {
                  relatedTopics = result;
                });
              }
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: isDataLoaded
          ? errorMessage.isNotEmpty
              ? Text(errorMessage)
              : characterData.relatedTopics!.isEmpty
                  ? const Text('No Data')
                  : OrientationBuilder(builder: (context, orientation) {
                      return orientation == Orientation.portrait
                          ? _portrait()
                          : isPhone? _portrait():_landscape();
                    })

          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _portrait() {
    lorientation = Orientation.portrait;
    return globals.searchRelatedTopics.isEmpty?
    ListView.builder(
      itemCount: characterData.relatedTopics?.length ?? 0,
      itemBuilder: (context, index) => getRow(index),
    ): ListView.builder(
      itemCount: globals.searchRelatedTopics.length,
      itemBuilder: (context, index) => getRow(index),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: globals.searchRelatedTopics.isEmpty?
      ListTile(
        onTap: () {
          // Navigate to Next Details
          lorientation == Orientation.portrait?
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailsPage(characterDatum: CharacterDatum(characterData.relatedTopics![index])),
              )) :
          setState(() {
            relatedTopics = characterData.relatedTopics![index];
          });

        },

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              //usersPets.data[index].userName,
              characterData.relatedTopics?[index].text.split("-")[0] ?? "No Name Found",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ):
    ListTile(
        onTap: () {
          // Navigate to Next Details
          lorientation == Orientation.portrait?
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailsPage(characterDatum: CharacterDatum(globals.searchRelatedTopics[index])),
              )) :
          setState(() {
            relatedTopics = globals.searchRelatedTopics[index];
          });

        },

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              //usersPets.data[index].userName,
              globals.searchRelatedTopics[index].text.split("-")[0] ?? "No Name Found",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
    )
    );
  }

  Widget _landscape() {
    lorientation = Orientation.landscape;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: characterData.relatedTopics?.length,
            itemBuilder: (context, index) => getRow(index),
          ),
        ),
        Expanded(
          flex: 1,
          child: DetailsPage(characterDatum: CharacterDatum(relatedTopics)),
        ),
      ],
    );
  }

}
