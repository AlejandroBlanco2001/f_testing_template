import 'package:f_testing_template/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  Future<Widget> createHomeScreen() async {
    WidgetsFlutterBinding.ensureInitialized();
    return const MyApp();
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Login sin creación de usuario", (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);
  });

  testWidgets("Login -> signup -> creación usuario -> login no exitoso",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);

    // Login
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);
    await tester.tap(find.byKey(const Key('ButoonLoginCreateAccount')));
    await tester.pumpAndSettle();

    // Sign up
    expect(find.byKey(const Key('SignUpPage')), findsOneWidget);

    // Creación de usuario
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'b@b.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '321321');
    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
    await tester.pumpAndSettle();

    // Login
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'bb@.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);
  });

  testWidgets("Login -> signup -> creación usuario -> login exitoso -> logout",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);

    // Login
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    // Sign up
    expect(find.byKey(const Key('SignUpPage')), findsOneWidget);

    // Login
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    // Login realizado correcto
    expect(find.byKey(const Key('HomePage')), findsOneWidget);

    // Log out
    await tester.tap(find.byKey(const Key('ButtonHomeLogOff')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsWidgets);
  });

  testWidgets(
      "Login -> signup -> creación usuario -> login éxitoso -> logout -> login exitoso",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);

    // Login
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    // Sign up
    expect(find.byKey(const Key('SignUpPage')), findsOneWidget);

    // Login
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    // Login realizado correcto
    expect(find.byKey(const Key('HomePage')), findsOneWidget);

    // Log out
    await tester.tap(find.byKey(const Key('ButtonHomeLogOff')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsWidgets);

    // Login de nuevo
    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    // Sign up
    expect(find.byKey(const Key('SignUpPage')), findsOneWidget);

    // Login
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    // Login realizado correcto
    expect(find.byKey(const Key('HomePage')), findsOneWidget);
  });

  testWidgets(
      "Login -> signup -> creación usuario -> login éxitoso -> logout -> login no exitoso",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);

    // Login
    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    // Sign up
    expect(find.byKey(const Key('SignUpPage')), findsOneWidget);

    // Login
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    // Login realizado correcto
    expect(find.byKey(const Key('HomePage')), findsOneWidget);

    // Log out
    await tester.tap(find.byKey(const Key('ButtonHomeLogOff')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsWidgets);

    // Login de nuevo
    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    // Sign up
    expect(find.byKey(const Key('SignUpPage')), findsOneWidget);

    // Login
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'b@b.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '321321');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    expect(find.text('User or passwor nok'), findsOneWidget);
  });
}
