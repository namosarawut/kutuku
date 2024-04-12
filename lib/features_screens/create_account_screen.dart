import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kutuku/bloc/register_bloc/register_cubit.dart';
import 'package:kutuku/constants/base_colors.dart';
import 'package:kutuku/routing/convert_route.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final myBloc = BlocProvider.of<RegisterFormBloc>(context);
    final registerFormBloc = BlocProvider.of<RegisterFormBloc>(context);
    Widget buildTextFormField(
        TextEditingController textEditingController,
        String label,
        IconData iconData,
        String hintText,
        bool focusNode,
        RegisterFormState state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: TextFormField(
              onTap: () {
                if (label == "Username") {
                  myBloc.toggleUsernameFocus(true);
                  myBloc.toggleEmailFocus(false);
                  myBloc.togglePasswordFocus(false);
                  myBloc.toggleConfirmPasswordFocus(false);
                } else if (label == "Email") {
                  myBloc.toggleUsernameFocus(false);
                  myBloc.toggleEmailFocus(true);
                  myBloc.togglePasswordFocus(false);
                  myBloc.toggleConfirmPasswordFocus(false);
                } else if (label == "Password") {
                  myBloc.toggleUsernameFocus(false);
                  myBloc.toggleEmailFocus(false);
                  myBloc.togglePasswordFocus(true);
                  myBloc.toggleConfirmPasswordFocus(false);
                } else if (label == "Confirm Password") {
                  myBloc.toggleUsernameFocus(false);
                  myBloc.toggleEmailFocus(false);
                  myBloc.togglePasswordFocus(false);
                  myBloc.toggleConfirmPasswordFocus(true);
                }
              },
              obscureText: label == "Confirm Password"
                  ? state.stateRedEyeTwo!
                  : label == "Password"
                      ? state.stateRedEye!
                      : false,
              autofocus: false,
              onFieldSubmitted: (t) {
                myBloc.toggleUsernameFocus(false);
                myBloc.toggleEmailFocus(false);
                myBloc.togglePasswordFocus(false);
                myBloc.toggleConfirmPasswordFocus(false);
                myBloc.emitTextControllerValues();

                print(
                    "username: ${state.username}|email: ${state.email}|password: ${state.password}|confirm password: ${registerFormBloc.confirmPasswordTextController.text}");
              },
              controller: textEditingController,
              decoration: InputDecoration(
                // Unfocused background color
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: Color(0xffA7AEC1),
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
                filled: true,
                fillColor: focusNode ? Colors.white : const Color(0xffFBFBFD),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: Icon(
                  iconData,
                  color:
                      focusNode ? kuTuKuPrimaryColor : const Color(0xffA7AEC1),
                  size: 30,
                ),
                suffixIcon: label == "Password" || label == "Confirm Password"
                    ? IconButton(
                        onPressed: () {
                          if (label == "Confirm Password") {
                            myBloc.toggleConfirmPasswordVisibility(
                                state.stateRedEyeTwo);
                          } else {
                            myBloc.togglePasswordVisibility(state.stateRedEye);
                          }
                        },
                        icon: label == "Password"
                            ? state.stateRedEye!
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.remove_red_eye_outlined)
                            : state.stateRedEyeTwo!
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.remove_red_eye_outlined),
                        color: focusNode
                            ? kuTuKuPrimaryColor
                            : const Color(0xffA7AEC1),
                      )
                    : const SizedBox(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide:
                      const BorderSide(color: kuTuKuPrimaryColor, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 2.0),
                ),
              ),
            ),
          ),
        ],
      );
    }

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff514EB7),
      foregroundColor: Colors.white,
    );

    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      builder: (context, state) {
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
                        myBloc.toggleUsernameFocus(false);
                        myBloc.toggleEmailFocus(false);
                        myBloc.togglePasswordFocus(false);
                        myBloc.toggleConfirmPasswordFocus(false);
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
                              buildTextFormField(
                                  registerFormBloc.usernameTextController,
                                  "Username",
                                  Icons.person_2_outlined,
                                  "Create your username",
                                  state.usernameFocus!,
                                  state),
                              buildTextFormField(
                                  registerFormBloc.emailTextController,
                                  "Email",
                                  Icons.mail_outline,
                                  "Enter Your email",
                                  state.emailFocus!,
                                  state),
                              buildTextFormField(
                                  registerFormBloc.passwordTextController,
                                  "Password",
                                  Icons.lock_outline,
                                  "Create your password",
                                  state.passwordFocus!,
                                  state),
                              buildTextFormField(
                                  registerFormBloc
                                      .confirmPasswordTextController,
                                  "Confirm Password",
                                  Icons.lock_clock_outlined,
                                  "Confirm your password",
                                  state.confirmPasswordFocus!,
                                  state),
                              const SizedBox(
                                height: 50,
                              ),
                              state.usernameFocus! ||
                                      state.emailFocus! ||
                                      state.passwordFocus! ||
                                      state.confirmPasswordFocus!
                                  ? const SizedBox.shrink()
                                  : buildRegisterButton(buttonStyle),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            bottomSheet: state.usernameFocus! ||
                    state.emailFocus! ||
                    state.passwordFocus! ||
                    state.confirmPasswordFocus!
                ? Container(
                    color: Colors.white,
                    child: buildRegisterButton(buttonStyle))
                : const SizedBox.shrink());
      },
    );
  }

  Row buildRegisterButton(ButtonStyle buttonStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            width: 327,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.verification.toStringPath());
              },
              style: buttonStyle,
              child:  Text('Create Account',style: TextStyle(fontSize: 20),),
            ),
          ),
        ),
      ],
    );
  }
}
