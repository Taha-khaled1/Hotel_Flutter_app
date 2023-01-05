// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hotelbooking/UI/chat/services/auth_controller.dart';
// import 'package:http/http.dart';
// import 'package:hotelbooking/Library/SupportingLibrary/Animation/LoginAnimation.dart';
// import 'package:hotelbooking/UI/IntroApps/forgetPass.dart';
// import 'package:hotelbooking/UI/IntroApps/travelSelection.dart';

// import 'SignUp.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> with TickerProviderStateMixin {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   void login(String email, password) async {
//     //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainSelection()), (route)=>false);
//     try {
//       var url = "http://localhost:3000/api/users/auth/login";
//       var response = await post(
//         Uri.parse(url),
//         body:
//             jsonEncode(<String, String>{'email': email, 'password': password}),
//         headers: <String, String>{'Content-Type': 'application/json'},
//       );
//       var data = jsonDecode(response.body.toString());
//       print(data['message']);
//       var ff = "success";
//       if (response.statusCode == 200) {
//         if (data['message'] == ff) {
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => MainSelection()),
//               (route) => false);
//         }
//       } else {
//         // print('failed');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   //Animation Declaration
//   late AnimationController sanimationController;

//   var tap = 0;

//   @override

//   /// set state animation controller
//   void initState() {
//     sanimationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 800))
//           ..addStatusListener((statuss) {
//             if (statuss == AnimationStatus.dismissed) {
//               setState(() {
//                 tap = 0;
//               });
//             }
//           });
//     // TODO: implement initState
//     super.initState();
//   }

//   /// Dispose animation controller
//   @override
//   void dispose() {
//     sanimationController.dispose();
//     super.dispose();
//   }

//   /// Playanimation set forward reverse
//   Future _PlayAnimation() async {
//     try {
//       await sanimationController.forward();
//       await sanimationController.reverse();
//     } on TickerCanceled {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     return GetBuilder<AuthViewModel>(
//       builder: (controller) => Scaffold(
//         backgroundColor: Colors.white,
//         body: ListView(
//           children: <Widget>[
//             Stack(
//               alignment: AlignmentDirectional.bottomCenter,
//               children: <Widget>[
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         height: 270,
//                         child: Stack(
//                           children: <Widget>[
//                             Positioned(
//                                 height: 300,
//                                 width: width + 20,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                           image: AssetImage(
//                                               'assets/image/destinationPopuler/tripBackground.png'),
//                                           fit: BoxFit.fill)),
//                                 ))
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 20,
//                           right: 20.0,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             /// Fade Animation for transtition animaniton

//                             Text(
//                               "Login",
//                               style: TextStyle(
//                                   fontFamily: "Sofia",
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 37.5,
//                                   wordSpacing: 0.1),
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color.fromRGBO(196, 135, 198, .3),
//                                       blurRadius: 20,
//                                       offset: Offset(0, 10),
//                                     )
//                                   ]),
//                               child: Column(
//                                 children: <Widget>[
//                                   Container(
//                                     padding: EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                         border: Border(
//                                             bottom: BorderSide(
//                                                 color: Colors.grey[200]!))),
//                                     child: TextFormField(
//                                       onSaved: (value) {
//                                         controller.email = value!;
//                                       },
//                                       validator: (value) {
//                                         if (value == null) {
//                                           print("Erorr");
//                                         }
//                                       },
//                                       controller: emailController,
//                                       decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                           hintText: "Email",
//                                           icon: Icon(
//                                             Icons.email,
//                                             color: Colors.black12,
//                                           ),
//                                           hintStyle: TextStyle(
//                                               color: Colors.grey,
//                                               fontFamily: "sofia")),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.all(10),
//                                     child: TextFormField(
//                                       controller: passwordController,
//                                       onSaved: (value) {
//                                         controller.password = value!;
//                                       },
//                                       validator: (value) {
//                                         if (value == null) {
//                                           print("Erorr");
//                                         }
//                                       },
//                                       obscureText: true,
//                                       decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                           hintText: "Password",
//                                           icon: Icon(
//                                             Icons.vpn_key,
//                                             color: Colors.black12,
//                                           ),
//                                           hintStyle: TextStyle(
//                                               color: Colors.grey,
//                                               fontFamily: "sofia")),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 InkWell(
//                                     onTap: () {
//                                       Get.to(Signup(),
//                                           transition: Transition.leftToRight,
//                                           duration:
//                                               Duration(milliseconds: 500));
//                                       // Navigator.of(context).pushReplacement(
//                                       //     PageRouteBuilder(
//                                       //         pageBuilder: (_, __, ___) => Signup(),
//                                       //         transitionDuration:
//                                       //             Duration(milliseconds: 2000),
//                                       //         transitionsBuilder: (_,
//                                       //             Animation<double> animation,
//                                       //             __,
//                                       //             Widget child) {
//                                       //           return Opacity(
//                                       //             opacity: animation.value,
//                                       //             child: child,
//                                       //           );
//                                       //         }));
//                                     },
//                                     child: Text(
//                                       "Create Account",
//                                       style: TextStyle(
//                                           color: Colors.black38,
//                                           fontFamily: "Sofia",
//                                           fontWeight: FontWeight.w300,
//                                           letterSpacing: 1.3),
//                                     )),
//                                 InkWell(
//                                     onTap: () {
//                                       Navigator.of(context).pushReplacement(
//                                           PageRouteBuilder(
//                                               pageBuilder: (_, __, ___) =>
//                                                   forgetPass(),
//                                               transitionDuration:
//                                                   Duration(milliseconds: 2000),
//                                               transitionsBuilder: (_,
//                                                   Animation<double> animation,
//                                                   __,
//                                                   Widget child) {
//                                                 return Opacity(
//                                                   opacity: animation.value,
//                                                   child: child,
//                                                 );
//                                               }));
//                                     },
//                                     child: Text(
//                                       "? Forget Password ",
//                                       style: TextStyle(
//                                           color: Colors.black38,
//                                           fontFamily: "Sofia",
//                                           fontWeight: FontWeight.w300,
//                                           letterSpacing: 1.3),
//                                     )),
//                               ],
//                             ),
//                             SizedBox(height: 110)
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 /// Set Animaion after user click buttonLogin
//                 tap == 0
//                     ? InkWell(
//                         splashColor: Colors.yellow,
//                         onTap: () {
//                           setState(() {
//                             tap = 1;
//                           });
//                           new LoginAnimation(
//                             animationController: sanimationController.view
//                                 as AnimationController,
//                           );
//                           _PlayAnimation();
//                         },
//                         child: Align(
//                           alignment: Alignment.bottomCenter,
//                           child: GestureDetector(
//                             onTap: () {
//                               _formKey.currentState!.save();
//                               if (_formKey.currentState!.validate()) {
//                                 controller.signInWithEmailAndPassword();
//                               }
//                             },
//                             child: Container(
//                               height: 55.0,
//                               margin: EdgeInsets.only(
//                                   left: 20.0, right: 20.0, top: 0.0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                                 color: Color(0xFF8DA2BF),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "Login",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontFamily: "Sofia",
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 19.5,
//                                       letterSpacing: 1.2),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     : new LoginAnimation(
//                         animationController:
//                             sanimationController.view as AnimationController,
//                       )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
