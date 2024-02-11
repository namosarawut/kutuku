import 'package:flutter/material.dart';
import 'package:kutuku/constants/base_colors.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final formKey = GlobalKey<FormState>();
  var usernameTextController = TextEditingController();
  bool stateRedEye = false;
  bool stateRedEyeTwo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width - 32,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      const Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        "start learning with create account",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w100),
                      ),
                      const SizedBox(height: 20),
                      buildTextFormField(usernameTextController, "Username",
                          Icons.person_2_outlined,"Create your username"),
                      buildTextFormField(
                          usernameTextController, "Email", Icons.mail_outline,"Enter Your email"),
                      buildTextFormField(usernameTextController, "Password",
                          Icons.lock_outline,"Create your password"),
                      buildTextFormField(usernameTextController,
                          "Confirm Password", Icons.lock_clock_outlined,"Confirm your password"),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }

  Widget buildTextFormField(TextEditingController textEditingController,
      String label, IconData iconData, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent),
          child: TextFormField(
            autofocus: false,

            controller: textEditingController,
            decoration: InputDecoration(
              // Unfocused background color
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Color(0xffA7AEC1),
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
              filled: true,
              fillColor:  FocusNode().hasFocus ? Colors.white : Color(0xffFBFBFD),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              prefixIcon: Icon(
                iconData,
                color: kuTuKuPrimaryColor,
                size: 30,
              ),
              suffixIcon: label == "Password" || label == "Confirm Password"
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          if (label == "Confirm Password") {
                            stateRedEyeTwo = !stateRedEyeTwo;
                          } else {
                            stateRedEye = !stateRedEye;
                          }
                        });
                      },
                      icon: label == "Password"
                          ? stateRedEye
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_outlined)
                          : stateRedEyeTwo
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_outlined),
                      color: Colors.lightBlueAccent,
                    )
                  : const SizedBox(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: kuTuKuPrimaryColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.transparent, width: 2.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
