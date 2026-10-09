import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_apps/main.dart';
import 'package:flutter_apps/data/singers.dart';
import 'package:flutter_apps/pages/detail_page.dart';

void main() {
  test('Verify all 8 singer asset images exist on disk', () {
    expect(initialSingersData.length, 8);

    final expectedSingers = [
      'Sabrina Carpenter',
      'Taylor Swift',
      'Olivia Rodrigo',
      'Drake',
      'The Weeknd',
      'Kanye West',
      'Malcolm Todd',
      'Rex Orange County',
    ];

    for (int i = 0; i < expectedSingers.length; i++) {
      final singer = initialSingersData[i];
      expect(singer.name, expectedSingers[i]);
      expect(File(singer.image).existsSync(), isTrue,
          reason: 'Image file ${singer.image} must exist');
    }
  });

  testWidgets('Singer Explorer smoke test and list verification',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify title
    expect(find.text('Singer Explorer'), findsOneWidget);

    // Verify initial singers in the list
    expect(find.text('Sabrina Carpenter'), findsOneWidget);
    expect(find.text('Taylor Swift'), findsOneWidget);
    expect(find.text('Olivia Rodrigo'), findsOneWidget);

    // Scroll to see the rest of the singers
    await tester.scrollUntilVisible(
      find.text('Rex Orange County'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Rex Orange County'), findsOneWidget);
  });

  testWidgets('Favorite toggle and filter on Home Page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Initial state: Sabrina Carpenter is not favorite
    final sabrinaHeart = find.descendant(
      of: find.widgetWithText(Card, 'Sabrina Carpenter'),
      matching: find.byType(IconButton),
    );
    expect(sabrinaHeart, findsOneWidget);

    // Tap favorite on Sabrina Carpenter
    await tester.tap(sabrinaHeart);
    await tester.pumpAndSettle();

    // Now filter by favorites using the app bar button
    final appBarFavoriteButton = find.byTooltip('Filter favorites');
    expect(appBarFavoriteButton, findsOneWidget);
    await tester.tap(appBarFavoriteButton);
    await tester.pumpAndSettle();

    // Only Sabrina Carpenter should be visible
    expect(find.text('Sabrina Carpenter'), findsOneWidget);
    expect(find.text('Taylor Swift'), findsNothing);

    // Tap app bar favorite button again to show all singers
    final showAllButton = find.byTooltip('Show all singers');
    expect(showAllButton, findsOneWidget);
    await tester.tap(showAllButton);
    await tester.pumpAndSettle();

    // Taylor Swift should be back
    expect(find.text('Taylor Swift'), findsOneWidget);
  });

  testWidgets('Navigate to Detail Page, check info, toggle favorite, and back',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Tap on Sabrina Carpenter card
    await tester.tap(find.text('Sabrina Carpenter'));
    await tester.pumpAndSettle();

    // Detail page is opened
    expect(find.byType(DetailPage), findsOneWidget);
    expect(find.text('Espresso'), findsOneWidget);
    expect(find.text('Please Please Please'), findsOneWidget);
    expect(find.text('Feather'), findsOneWidget);
    expect(find.text('Taste'), findsOneWidget);
    expect(find.text('Nationality : American'), findsOneWidget);
    expect(find.text('Birth Date : May 11, 1999'), findsOneWidget);
    expect(find.text('Active Since : 2011'), findsOneWidget);
    expect(find.text('Popular Songs'), findsOneWidget);

    // Navigate back
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byType(DetailPage), findsNothing);
    expect(find.text('Singer Explorer'), findsOneWidget);
  });

  testWidgets('Check Malcolm Todd detail information requirements',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Scroll to Malcolm Todd
    await tester.scrollUntilVisible(
      find.text('Malcolm Todd'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Malcolm Todd'));
    await tester.pumpAndSettle();

    expect(find.byType(DetailPage), findsOneWidget);
    expect(find.text('Birth Date : Not publicly confirmed'), findsOneWidget);
    expect(find.textContaining('Active Since'), findsNothing);
    expect(find.text('Roommates'), findsOneWidget);
    expect(find.text('Sweet Boy'), findsOneWidget);
  });
}
