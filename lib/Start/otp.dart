import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horus_frontend/Components/snack_bar.dart';
import 'package:horus_frontend/Components/submit_button.dart';
import 'package:horus_frontend/Start/createprofile.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _StartState();
}

class _StartState extends State<OTPPage> {
  bool? isTermChecked = false;

  List otpController = [for (int i = 1; i <= 7; i++) TextEditingController()];
  @override
  Widget build(BuildContext context) {
    const phoneNumber = "+62 0812 3456 7890"; // Phone number scrapping

    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFCA5A),
                      Color(0xFFD3991E),
                    ])),
            child: Center(
              child: Image.asset('assets/content2.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verified Your Account",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "Enter the code sent to",
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    phoneNumber,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Color(0xFF15146B)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 1; i <= 6; i++)
                    SizedBox(
                        width: 55,
                        child: TextField(
                          controller: otpController[i - 1],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            counterText: '',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            border: null,
                            filled: true,
                            fillColor: const Color(0xFFF1F1F1),
                            contentPadding: const EdgeInsets.all(20.0),
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Color(0xFFF1F1F1))),
                            // icon: const Icon(Icons.call, color: Colors.orange),
                          ),
                        )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Not receive any codes?",
                    style: TextStyle(fontSize: 10),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Resend Function
                    },
                    child: const Text(
                      "Resend here",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF15146B),
                          fontSize: 10),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SubmitButton(
                buttonText: "Verify",
                nextPageFunction: () {
                  for (TextEditingController item in otpController) {
                    print(item.text);
                  }
                  if (otpController[0].text != '' &&
                      otpController[1].text != '' &&
                      otpController[2].text != '' &&
                      otpController[3].text != '' &&
                      otpController[4].text != '' &&
                      otpController[5].text != '')
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateProfile()));
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: HorusSnackBar(
                          fgColor: Colors.white,
                          message: "Please fill your OTP Correctly",
                          status: false,
                        )));
                  }
                },
                foreColor: Colors.white,
              )
            ],
          ),
        )
      ],
    ));
  }
}
