// import 'package:flutter/material.dart';
//
//
// Container(
// color: Colors.white,
// padding: EdgeInsets.all(15),
// child: Column(
// mainAxisSize: MainAxisSize.min,
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// Text(
// "SIGN UP",
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.blue[900],
// fontSize: 25.0,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// height: 16,
// ),
// FormFieldWidget(
// onChange: () {},
// keyboard: TextInputType.emailAddress,
// text: "email",
// icon: Icon(
// Icons.email_outlined,
// color: Colors.white,
// size: 45.0,
// ),
// ),
// SizedBox(
// height: 16,
// ),
// FormFieldWidget(
// text: "Password",
// obsecureText: true,
// icon: Icon(
// Icons.lock_outline,
// color: Colors.white,
// size: 45.0,
// ),
// ),
// SizedBox(
// height: 16,
// ),
// FormFieldWidget(
// obsecureText: true,
// text: "Re-Enter Password",
// icon: Icon(
// Icons.lock_outline,
// color: Colors.white,
// size: 45.0,
// ),
// ),
// SizedBox(
// height: 16,
// ),
// ElevatedButton(onPressed: () {}, child: Text("Sign Up"))
// ],
// ),
// );
// }
//
// Widget FormFieldWidget({text, icon, keyboard, onChange, obsecureText}) {
//   return TextFormField(
//     obscureText: obsecureText,
//     onChanged: onChange,
//     keyboardType: keyboard,
//     style: TextStyle(
//       color: Colors.black,
//     ),
//     decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         icon: icon,
//         hintText: text,
//         hintStyle: TextStyle(color: Colors.grey),
//         contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey[400]),
//         ),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.grey[400],
//             ))),
//   );
// }
// }
