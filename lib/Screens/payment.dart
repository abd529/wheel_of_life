// import 'stri';
// import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {

//   Future<bool> makePayment() async {
//     try {
//       paymentIntentData = await createPaymentIntent(
//           widget.money, 'USD'); //json.decode(response.body);
//       await Stripe.instance
//           .initPaymentSheet(
//               paymentSheetParameters: SetupPaymentSheetParameters(
//                   paymentIntentClientSecret:
//                       paymentIntentData!['client_secret'],
//                   style: ThemeMode.dark,
//                   merchantDisplayName: 'ANNIE'))
//           .then((value) {});
//       displayPaymentSheet();
//       return true;
//     } catch (e, s) {
//       if (kDebugMode) {
//         print(s);
//       }
//       return false;
//     }
//   }

//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet().then((newValue) {
//         payFee();

//         paymentIntentData = null;
//       }).onError((error, stackTrace) {
//         if (kDebugMode) {
//           print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
//         }
//       });
//     } on StripeException catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print('$e');
//       }
//     }
//   }

//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };
//       var response = await http.post(
//           Uri.parse('https://api.stripe.com/v1/payment_intents'),
//           body: body,
//           headers: {
//             'Authorization':
//                 'Bearer sk_test_51N3ozXKuYtdF845oo54vweQDKUNllgiNE5EZwtO2UVMxVGQhJoysGNOZEYRrHbMtj6SNI72W58B4c50Im7IxXGKs00DASLWthd',
//             'Content-Type': 'application/x-www-form-urlencoded'
//           });
//       // showDialog(
//       //     context: context,
//       //     builder: (_) => const AlertDialog(
//       //           content: Text("Success "),
//       // ));
//       print(response.body);
//       body = jsonDecode(response.body);
//       print(body["id"]);
//       // showPaymentInfo(body["id"]);
//       return jsonDecode(response.body);
//     } catch (err) {
//       if (kDebugMode) {
//         print('err charging user: ${err.toString()}');
//       }
//     }
//   }

//   calculateAmount(String amount) {
//     final a = (int.parse(amount)) * 100;
//     return a.toString();
//   }

//   Future<void> showPaymentInfo(String paymentIntentId) async {
//     try {
//       PaymentIntent paymentIntent =
//           await Stripe.instance.retrievePaymentIntent(paymentIntentId);
//       String amount = (paymentIntent.amount / 100).toStringAsFixed(2);
//       String currency = paymentIntent.currency.toUpperCase();
//       PaymentIntentsStatus status = paymentIntent.status;

//       // Display the payment information to the user
//       print('Payment of $amount $currency was $status.');
//     } catch (e) {
//       print('Error retrieving payment information: $e');
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }