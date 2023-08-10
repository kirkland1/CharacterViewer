import 'package:flutter/material.dart';
import 'package:character_viewer/Data/character_data.dart';

import '../Config/constants.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.characterDatum});

  final CharacterDatum characterDatum;
  late String image;

  void initState() {
    characterDatum.relatedTopics!.icon?.url != null ||
            characterDatum.relatedTopics!.icon?.url != ""
        ? image = "assets/images/placeholder.png"
        : image =
            "https://duckduckgo.com" + characterDatum.relatedTopics!.icon!.url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${characterDatum.relatedTopics?.text.split("-")[0]}"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 150,
                  child: (characterDatum.relatedTopics!.icon?.url != null &&
                          characterDatum.relatedTopics!.icon?.url != "")
                      ? ClipOval(
                          child: Image.network(
                              Constants.DUCKDUCK +
                                  characterDatum.relatedTopics!.icon?.url,
                              width: 200,
                              height: 200,
                              fit: BoxFit.scaleDown),
                        )
                      : ClipOval(
                          child: Image.asset("assets/images/placeholder.png",
                              width: 200, height: 200, fit: BoxFit.scaleDown),
                        ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    characterDatum.relatedTopics!.text,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
