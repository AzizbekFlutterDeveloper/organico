import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:git/provider/dark_vs_light_provider.dart';
import 'package:git/provider/icons_provider.dart';
import 'package:git/router/my_route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.openBox("data");
  await Hive.openBox("likes");
  await Hive.openBox("karzinka");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DarkVsLightProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PasswordIconsProvider(),
        ),
        ChangeNotifierProvider(create: (context) => CheckBoxProvider(),),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _forRoute = MyRouter();

  @override
  Widget build(BuildContext context) {
    var themdata = context.watch<DarkVsLightProvider>().scaffoldColor;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themdata,
      onGenerateRoute: _forRoute.generateRoute,
    );
  }
}
