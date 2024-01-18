import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horus_frontend/Components/input_field.dart';
import 'package:horus_frontend/Components/snack_bar.dart';
import 'package:horus_frontend/Components/submit_button.dart';
import 'package:horus_frontend/Start/otp.dart';
import 'package:horus_frontend/Start/terms.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  bool? isTermChecked = false;

  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.onPrimary,
                        ])),
                child: Center(
                  child: Image.asset('assets/content.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get Started",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                      placeholder: "081234567890",
                      isThereIcon: true,
                      controller: phoneNumberController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isTermChecked,
                        onChanged: (value) {
                          setState(() {
                            isTermChecked = value;
                          });
                        },
                      ),
                      Row(
                        children: [
                          const Text("Agree to our"),
                          const SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TermsAndConditions()));
                            },
                            child: Text(
                              "Terms and Conditions",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SubmitButton(
                    nextPageFunction: () {
                      const snackbar = SnackBar(
                          backgroundColor: Colors.red,
                          content: HorusSnackBar(
                              fgColor: Colors.white,
                              message:
                                  "Please agree to our terms and conditions",
                              status: false));

                      if (!isTermChecked!) {
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      } else {
                        if (phoneNumberController.text == "") {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: HorusSnackBar(
                                    fgColor: Colors.white,
                                    message:
                                        "Please fill your phone number first",
                                    status: false,
                                  )));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OTPPage()));
                        }
                      }
                    },
                    buttonText: "Start",
                    foreColor: Colors.white,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
