import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wheel_of_life/Authentication/forgot_password.dart';
import 'package:wheel_of_life/Quiz%20Functionality/quiz_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:wheel_of_life/Screens/onboard_screen.dart';
import 'package:wheel_of_life/Screens/stripe_payment.dart';
import 'package:wheel_of_life/Screens/youtube_screen.dart';
import 'Authentication/login_screen.dart';
import 'Quiz Functionality/Quiz/quiz.dart';
import 'Screens/email.dart';
import 'Screens/home_screen.dart';
import 'Screens/report.dart';
import 'l10n/l10n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51N6W5EGatw2HfTd6c60FZQm1vK3PkiPhvTHXHsEyxwoRSTqD5n0wI5ygeIyQc9CLPlxrw5W3Bh1ANzNK1FochHAP00V7eHWlsg"; 
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
      home: FirebaseAuth.instance.currentUser != null? const Onboard() : LoginScreen(),
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
        ForgotPassword.routeName : (ctx) => ForgotPassword(),
        EmailSend.routeName : (ctx) => EmailSend(),
        StripePayment.routeName : (ctx) => const StripePayment(), 
      },
    );
  }
}
