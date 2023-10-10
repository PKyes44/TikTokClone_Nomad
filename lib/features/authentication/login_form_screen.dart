import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});
  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Map<String, String> memberData = {};

  void onSubmitTap() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
      }
    }
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Log in"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (newValue) {
                    if (newValue != null) {
                      memberData['email'] = newValue;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                  validator: (value) {
                    // return "Email format is incorrect";
                    return null;
                  },
                ),
                Gaps.v16,
                TextFormField(
                  onSaved: (newValue) {
                    if (newValue != null) {
                      memberData['password'] = newValue;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                  validator: (value) {
                    // return "Wrong password";
                    return null;
                  },
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: onSubmitTap,
                  child: const FormButton(
                    disabled: false,
                    text: "Log in",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
