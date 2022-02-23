import 'package:flutter/material.dart';
import 'package:git/provider/dark_vs_light_provider.dart';
import 'package:git/router/my_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DarkVsLightProvider(),
        ),
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
