// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:character_viewer/Config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:character_viewer/MainDelegates/main_simpsons.dart';
import 'package:character_viewer/MainDelegates/character_viewer_app.dart';

void main() {

  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  testWidgets('Add and remove a todo', (tester) async {
    WidgetsFlutterBinding.ensureInitialized();
    Constants.setEnvironment(Environment.SIMPSONS);

    // Build the widget.
    await tester.pumpWidget(const CharacterViewerApp());
    await tester.pumpAndSettle();


    // Tap the search button.
    await tester.tap(find.byType(IconButton));

    // Rebuild the widget with the new item.
    await tester.pump();

    // Expect to find the item on screen.
    expect(find.text('bro'), findsOneWidget);

    // Swipe the item to dismiss it.
    await tester.drag(find.byType(Dismissible), const Offset(500, 0));

    // Build the widget until the dismiss animation ends.
    await tester.pumpAndSettle();

    // Ensure that the item is no longer on screen.
    expect(find.text('bro'), findsNothing);
  });
}
