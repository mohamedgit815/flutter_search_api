import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Helper/Constance/const_colors.dart';
import 'package:flutter_app/Test/test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestApp' ,
      restorationScopeId: 'root' ,
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        primaryColor: lightMainColor,
        iconTheme: const IconThemeData(
          color: lightMainColor,
        ),
        primaryIconTheme: const IconThemeData(
        color: lightMainColor,
        )
        ),
      home: const TestScreen()
    );
  }
}
