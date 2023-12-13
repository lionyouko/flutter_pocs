import 'package:flutter/material.dart';
import 'package:flutter_advisor_clean_architecture/application/presentation_services/theme_service.dart';
import 'package:flutter_advisor_clean_architecture/application/screens/advice/advice_screen.dart';
import 'package:flutter_advisor_clean_architecture/theme.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di;

// But by using di in the project, the collateral is that: main turns into async, we need to use the ensureInitialized and then wait for the di.
void main() async {
  // wait the bindings before anything else
  WidgetsFlutterBinding.ensureInitialized();
  // wait until all the dependencies is gotten
  await di.init();

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const AdviceScreenWrapperProvider(),
      );
    });
  }
}
