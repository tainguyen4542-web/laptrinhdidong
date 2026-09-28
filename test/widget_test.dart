// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:huutai/main.dart';

void main() {
  testWidgets('shows the complete developer profile', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ProfileApp());
    await tester.pumpAndSettle();

    expect(find.text('Alex Rivers'), findsOneWidget);
    expect(find.text('Tokyo, Japan'), findsOneWidget);
    expect(find.text('148'), findsOneWidget);
    expect(find.text('Skills & Expertise'), findsOneWidget);
    expect(find.text('E-Shop Flutter'), findsOneWidget);
    expect(find.text('Crypto Vault'), findsOneWidget);
    expect(find.text('Contact Information'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('centers the 390px profile frame on wider screens', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1000, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ProfileApp());
    await tester.pumpAndSettle();

    final frameRect = tester.getRect(find.byKey(const Key('profile-frame')));
    expect(frameRect.width, 390);
    expect(frameRect.center.dx, 500);
    expect(find.text('alex.rivers@email.com'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
