// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wheel_of_life/Authentication/login_screen.dart';
import 'package:wheel_of_life/Quiz%20Functionality/Quiz/baseline_quiz.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = "home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ]; 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
       drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.purple,
              ), //BoxDecoration
              child: SvgPicture.asset("assets/logo.svg"),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' Profile '),
              onTap: () {
                Navigator.of(context).pushNamed("");
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text(' Language'),
              onTap: () {
                Navigator.of(context).pushNamed("");
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(' Settings '),
              onTap: () {
                Navigator.of(context).pushNamed("");
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.1),
                 borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: size.width/9),
                    Center(
                      child: SvgPicture.asset(
                                   "assets/logo.svg",
                                   width: 85,
                                   height: 85,
                                  ),
                    ),
                    IconButton(
                        onPressed:() { _scaffoldKey.currentState!.openDrawer();
                        print("hehhe");
                        }, icon: const Icon(Icons.menu, size: 35,color: Colors.purple,) )            
                  ],
                  ),
                  const SizedBox(height: 150,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("${months[DateTime.now().month]} ${DateTime.now().day}, ${DateTime.now().year}", textAlign: TextAlign.left,)
                          ),
                          const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Your text here", style: TextStyle(fontSize: 24, color: Colors.purple ,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Your text here"),
                      ),
                      const SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text("True North", style: TextStyle(fontSize: 20),),
                  const SizedBox(height: 20,),
              const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", softWrap: true, textAlign: TextAlign.justify,),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed(BaseLineQuiz.routeName);
              },  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                        shape: RoundedRectangleBorder( //to set border radius to button
                  borderRadius: BorderRadius.circular(50)
                            ),
                    ), child: const Text("Start"))
                ],
              ),
            ),
            
          ],
        ),
      )),
    );
  }
}