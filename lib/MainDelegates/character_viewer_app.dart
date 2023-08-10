import 'package:flutter/material.dart';
import 'package:character_viewer/Screens/home_page.dart';
import 'package:flutter/services.dart';
import 'package:character_viewer/Config/globals.dart' as globals;

void mainDelegate() {

  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,
  DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((value) => runApp(const CharacterViewerApp()));
}

class CharacterViewerApp extends StatelessWidget {
  const CharacterViewerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    globals.searchContext = context;
    return MaterialApp(
      title: 'Rest API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
