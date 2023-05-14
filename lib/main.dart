import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wheel_of_life/Authentication/forgot_password.dart';
import 'package:wheel_of_life/Quiz%20Functionality/quiz_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheel_of_life/Screens/youtube_screen.dart';
import 'Authentication/login_screen.dart';
import 'Quiz Functionality/Quiz/quiz.dart';
import 'Screens/email.dart';
import 'Screens/report.dart';
import 'l10n/l10n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale locale){
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
   Locale _locale = const Locale("en");
   setLocale(Locale newLocale){
    setState(() {
      _locale = newLocale;
    });
   }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.purple,
      ),
      home: FirebaseAuth.instance.currentUser != null? EmailSend() : LoginScreen(),
      supportedLocales: L10n.all,
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      routes: {
        logQuiz.routeName : (ctx) => const logQuiz(),
        LoginScreen.routeName : (ctx) => LoginScreen(),
        VideoScreen.routeName : (ctx) => VideoScreen(),
        DetailPage.routeName : (ctx) => const DetailPage(),
        Quiz.routeName : (ctx) => const Quiz(),
        ForgotPassword.routeName : (ctx) => ForgotPassword() 
      },
    );
  }
}
