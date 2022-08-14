// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_scanner/cubit/qrcubit.dart';

import 'package:qr_scanner/main.dart';
import 'package:qr_scanner/pages/home.dart';
import 'package:qr_scanner/pages/home_provider.dart';

void main() {
  testWidgets('Checking if it builds HomeProvider',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeProvider(),
      ),
    );
      
     

    final blocProvider = find.byType(BlocProvider<QrCubit>);
    expect(blocProvider, findsOneWidget);

    final button = find.byType(Image);
    expect(button, findsOneWidget);
    
    });
}
/* 
final qrCubit = find.byElementType(QrCubit);
    expect(qrCubit, qrCubit);
    


    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    */
