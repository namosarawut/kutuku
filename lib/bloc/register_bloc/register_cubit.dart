import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class RegisterFormBloc extends Cubit<RegisterFormState> {
  RegisterFormBloc() : super(const RegisterFormState());
  // Text editing controllers
  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
  TextEditingController();

  void togglePasswordVisibility(bool? stateRedEye) {
    stateRedEye = !stateRedEye!;
    emit(state.copyWith(stateRedEye: stateRedEye));
  }

  void toggleConfirmPasswordVisibility(bool? stateRedEyeTwo) {
    stateRedEyeTwo = !stateRedEyeTwo!;
    emit(state.copyWith(stateRedEyeTwo: stateRedEyeTwo));
  }

  void toggleUsernameFocus(bool? usernameFocus) {
    emit(state.copyWith(usernameFocus: usernameFocus));
  }

  void toggleEmailFocus(bool? emailFocus) {
    emit(state.copyWith(emailFocus: emailFocus));
  }

  void togglePasswordFocus(bool? passwordFocus) {
    emit(state.copyWith(passwordFocus: passwordFocus));
  }

  void toggleConfirmPasswordFocus(bool? confirmPasswordFocus) {
    log("confirmPasswordFocus ${confirmPasswordFocus}");
    emit(state.copyWith(confirmPasswordFocus: confirmPasswordFocus));
  }


  // Function to emit values from text controllers
  void emitTextControllerValues() {
    emit(state.copyWith(
      username: usernameTextController.text,
      email: emailTextController.text,
      password: passwordTextController.text,
      confirmPassword: confirmPasswordTextController.text,
    ));
  }

  // Toggle functions for visibility and focus (previously defined)

  @override
  Future<void> close() {
    // Clean up controllers when the bloc is closed
    usernameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    return super.close();
  }
}

class RegisterFormState extends Equatable {
  final bool? stateRedEye;
  final bool? stateRedEyeTwo;
  final bool? usernameFocus;
  final bool? emailFocus;
  final bool? passwordFocus;
  final bool? confirmPasswordFocus;
  final String? username;
  final String? email;
  final String? password;
  final String? confirmPassword;

   const RegisterFormState({
    this.stateRedEye = false,
    this.stateRedEyeTwo = false,
    this.usernameFocus = false,
    this.emailFocus = false,
    this.passwordFocus = false,
    this.confirmPasswordFocus = false,
     this.username = '',
     this.email = '',
     this.password = '',
     this.confirmPassword = '',
  });

  RegisterFormState copyWith({
    bool? stateRedEye,
    bool? stateRedEyeTwo,
    bool? usernameFocus,
    bool? emailFocus,
    bool? passwordFocus,
    bool? confirmPasswordFocus,
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterFormState(
      stateRedEye: stateRedEye ?? this.stateRedEye,
      stateRedEyeTwo: stateRedEyeTwo ?? this.stateRedEyeTwo,
      usernameFocus: usernameFocus ?? this.usernameFocus,
      emailFocus: emailFocus ?? this.emailFocus,
      passwordFocus: passwordFocus ?? this.passwordFocus,
      confirmPasswordFocus: confirmPasswordFocus ?? this.confirmPasswordFocus,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object?> get props => [
        stateRedEye,
        stateRedEyeTwo,
        usernameFocus,
        emailFocus,
        passwordFocus,
        confirmPasswordFocus,
    username,
    email,
    password,
    confirmPassword,
      ];
}
