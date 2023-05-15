import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripePayment extends StatefulWidget {
  static const routeName = "stripe-pay";
  const StripePayment({super.key});

  @override
  State<StripePayment> createState() => _StripePaymentState();
}

class _StripePaymentState extends State<StripePayment> {
  Map<String, dynamic> paymentIntent = {};
  
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': "100",
        'currency': "USD",
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51N6W5EGatw2HfTd69z1LuUuLJrwj7MhFbZSaHQXgpzbLzt4YDVFKSA8V2X0jcd9kcWXEEyvEK5OsyJwmqmAkCrmm00lQyI5js7',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print(response.body);
      body = jsonDecode(response.body);
      print(body["id"]);
      return jsonDecode(response.body);
    } catch (err) {
      if (kDebugMode) {
        print('err charging user: ${err.toString()}');
        throw Exception(err.toString());
      }
    }
  }

  void  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) {
        // payFee();
        // paymentIntentData = null;
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
        }
      });
    } on StripeException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } catch (e) {
      if (kDebugMode) {
        print('$e');
      }
    }
  }

  void makePayment()async{
    try {
      paymentIntent = await createPaymentIntent("200","USD"); //json.decode(response.body);
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntent['client_secret'],
                  style: ThemeMode.dark,
                  merchantDisplayName: 'ANNIE'))
          .then((value) {});
      displayPaymentSheet();
     // return true;
    } catch (e, s) {
      if (kDebugMode) {
        print(s);
      }
     // return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Text("Stripe Payment"),
        ElevatedButton(onPressed: (){
          makePayment();
        }, child: Text("Pay"))
      ]),
    );
  }
}