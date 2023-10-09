import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  final DateTime maxDate = DateTime(
      DateTime.now().year - 12, DateTime.now().month, DateTime.now().day);

  @override
  void initState() {
    super.initState();
    setTextFieldDate(maxDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void setTextFieldDate(DateTime date) {
    String textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void onSubmit() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Sign Up",
            style: TextStyle(),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "When is your birthday?",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v8,
              const Text(
                "Your birthday won't be shown publicly",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black54,
                ),
              ),
              Gaps.v16,
              TextField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                enabled: false,
                controller: _birthdayController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              Gaps.v16,
              GestureDetector(
                onTap: onSubmit,
                child: const FormButton(
                  disabled: false,
                  text: "Next",
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              maximumDate: maxDate,
              initialDateTime: maxDate,
              onDateTimeChanged: setTextFieldDate,
            ),
          ),
        ),
      ),
    );
  }
}
