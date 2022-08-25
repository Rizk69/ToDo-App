
import 'package:flutter/material.dart';
import 'package:todoproject/Home/EditTask/EditTask.dart';
import 'package:todoproject/Home/Home_screen.dart';
import 'package:todoproject/Mytheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Home/Splash/AnimatedSplashScreen.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'Home/providre/SettingProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider<SettingProvider>(
      create: (buildcontext) {
        return SettingProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<SettingProvider>(context);

    return MaterialApp(
         home:AnimatedScreen(),

      routes: {

        Home_Screen.routenamed: (_) => Home_Screen(),


      },
       initialRoute: Home_Screen.routenamed,
      theme: Mytheme.lighttheme,
      themeMode: settingprovider.curenttheme,
      darkTheme: Mytheme.darktheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      locale: Locale(settingprovider.curentlang), // English, no country code
      // arabic, no country code
    );
  }
}


