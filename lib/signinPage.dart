import 'package:flutter/material.dart';
import 'signupPage.dart';
import 'newsPage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/welcome1.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WELCOME",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormFieldWidget(
                      iconImage: Icon(
                        Icons.email_outlined,
                        color: Colors.grey[500],
                      ),
                      text: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormFieldWidget(
                      iconImage: Icon(
                        Icons.lock_outline,
                        color: Colors.grey[500],
                      ),
                      text: "Password (6 characters)",
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: MaterialButton(
                        height: 45,
                        minWidth: 200,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsPage()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 25),
                        ),
                        color: Colors.lightBlueAccent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an Account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: Text(
                            " Sign Up",
                            style: TextStyle(
                              color: Colors.yellow[800],
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget TextFormFieldWidget(
      {obscureText = false,
      controller,
      keyboardType,
      text,
      onChange,
      iconImage}) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 18.0,
        ),
        onChanged: onChange,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
            prefixIcon: iconImage,
            hintText: text,
            hintStyle: TextStyle(color: Colors.grey[700]),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
              borderSide: BorderSide(
                color: Colors.grey[700],
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                borderSide: BorderSide(
                  color: Colors.grey[700],
                ))),
      ),
    );
  }
}
