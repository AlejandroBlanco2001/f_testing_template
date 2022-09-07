// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_testing_template/ui/pages/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Widget login validación @ email', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      key: Key('LoginScreen'),
      email: 'blank',
      password: 'blank',
    )));

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'b');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    expect(find.text('Enter valid email address'), findsOneWidget);
  });

  testWidgets('Widget login validación campo vacio email',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
            key: Key("LoginScreen"), email: "blank", password: "blank")));
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), '');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    expect(find.text('Enter email'), findsOneWidget);
  });

  testWidgets('Widget login validación número de caracteres password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      key: Key("LoginScreen"),
      email: "blank",
      password: "blank",
    )));
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '123');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    expect(find.text('Password should have at least 6 characters'),
        findsOneWidget);
  });

  testWidgets('Widget login validación campo vacio password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      key: Key("LoginScreen"),
      email: "blank",
      password: "blank",
    )));
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'b@.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    expect(find.text('Enter password'), findsOneWidget);
  });

  testWidgets('Widget login autenticación exitosa',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      key: Key("LoginScreen"),
      email: "b@.com",
      password: "321321",
    )));
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'b@.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsNothing);
  });

  testWidgets('Widget login autenticación no exitosa',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      key: Key("LoginScreen"),
      email: "a@.com",
      password: "123456",
    )));
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'bc@.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    expect(find.text('User or passwor nok'), findsOneWidget);
  });

  testWidgets('Widget signUp validación @ email', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      key: Key("LoginScreen"),
      email: "blank",
      password: "blank",
    )));
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'b');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    expect(find.text('Enter valid email address'), findsOneWidget);
  });

  testWidgets('Widget signUp validación campo vacio email',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      key: Key("LoginScreen"),
      email: "blank",
      password: "blank",
    )));
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), '');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    expect(find.text('Enter email'), findsOneWidget);
  });

  testWidgets('Widget signUp validación número de caracteres password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      key: Key("LoginScreen"),
      email: "blank",
      password: "blank",
    )));
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '321');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    expect(find.text('Password should have at least 6 characters'),
        findsOneWidget);
  });

  testWidgets('Widget signUp validación campo vacio password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      key: Key("LoginScreen"),
      email: "blank",
      password: "blank",
    )));
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    expect(find.text('Enter password'), findsOneWidget);
  });

  testWidgets('Widget home visualización correo', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginScreen(
          key: Key('LoginScreen'), email: 'b@b', password: '321321'),
    ));

    String email = "b@b";

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), email);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    expect(find.text('Hello $email'), findsOneWidget);
  });

  testWidgets('Widget home nevegación detalle', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginScreen(
          key: Key('LoginScreen'), email: 'b@b', password: '321321'),
    ));

    String email = "b@b";

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), email);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('ButtonHomeDetail')));

    await tester.pumpAndSettle();

    expect(find.text('Some detail'), findsOneWidget);
  });

  testWidgets('Widget home logout', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginScreen(
          key: Key('LoginScreen'), email: 'b@b', password: '321321'),
    ));

    String email = "b@b";

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), email);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('ButtonHomeLogOff')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsWidgets);
  });
}
