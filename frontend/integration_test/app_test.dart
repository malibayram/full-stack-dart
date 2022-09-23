import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/main.dart';
import 'package:patrol/patrol.dart';

// Unit Test
// Widget Test
// Integration Test // Tam kapsamlı olarak yazılırsa ->
// unit test ve widget testlerini de kapsar.
// Golden Test // Ekran görüntüleri üzerinden karşılaştırma yapar.
void main() async {
  await initApp();
  patrolTest('App Tests', ($) async {
    // Bu ilk adım: uygulamamızın çalışmasını sağlar
    await $.pumpWidgetAndSettle(const MyApp());

    await Future.delayed(const Duration(seconds: 2));

    // Bu iki adımda da bulmak istediğimiz widget üzerindeki metinden
    // yola çıkarak widgeti buluruz ve içine istediğimiz metni gireriz
    /*  await $(#email).enterText('baome.com');
    await $('Login').tap();
    expect($('This field requires a valid email address'), findsOneWidget); */
    await Future.delayed(const Duration(seconds: 2));
    await $(#email).enterText('bartek@awesome.com');
    await Future.delayed(const Duration(seconds: 2));
    await $(#password).enterText('bartek123');
    await Future.delayed(const Duration(seconds: 2));

    // Bu adımda da: tıklamak istediğimiz butonu üstündeki metinden
    // buluruz ve tıklarız
    await $('Login').tap();
    await Future.delayed(const Duration(seconds: 10));
  });
}
