import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    List termsList = [
      ["1. Acceptance of Terms", "By downloading, installing, or using Horus mobile application, you agree to comply with and be bound by the following Terms and Agreements of Use. If you do not agree with these terms, please refrain from using the app."],
      ["2. User Eligibility", "2.1. Horus is intended for users aged 15 or older.\n2.2. Users under the age of 15 must have the consent and supervision of a parent or guardian to use the"],
      ["3. Purpose and Mission", "3.1. Horus is designed to contribute to the achievement of the United Nations Sustainable Development Goals 5 (Gender Equality) and 10 (Reduced Inequalities).\n3.2. The main objective of the app is to reduce the incidents of sexual harassment or violence in public spaces."],
      ["4. User Conduct", "4.1. Users are expected to engage with the app in the manner that promotes a safe and respectful environment.\n4.2. Any misuse or inappropriate behaviour will result in the immediate termination of the user’s account."],
      ["5. Privacy and Security", "5.1. Your privacy is important to us. Please refer to our Privacy Policy to understand how your data is collected, used, and protected.\n5.2. Users are prohibited from attempting to breach the app’s security or gain unauthorised access to user’s data."],
      ["6. Reporting Incidents", "6.1. Users are encouraged to report any incidents of sexual harassment or violence witnessed or experienced in public spaces through the app’s reporting features.\n6.2. All reports will be treated with the utmost confidentiality and used for the sole purpose of addressing and preventing such incidents."],
      ["7. Limitation of Liability", "7.1. Horus is not liable for any direct, indirect, incidental, special, or consequential damages arising out of the use or inability to use the app.\n7.2. The app provides information and tools for safety but does not guarantee the prevention of incidents."],
      ["8. Updates and Modifications", "8.1. The app may be updated or modified to enhance its functionality and effectiveness.\n8.2. Users will be notified of significant chances of the Terms and Agreements of Use"],
      ["9. Contact Information", "If you have any questions or concerns regarding these Terms and Agreements of Use, please contact us at ad.infinitum.horus@gmail.com"],
    ];
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/yellowheader.png"),
                    fit: BoxFit.fill
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Text("Terms and", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),),
                  const Text("Conditions", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                  ),),
                  const SizedBox(
                    height: 50,
                  )

                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: ListView.builder(
                    itemCount: termsList.length,
                    itemBuilder: (context, index) {
                      return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(termsList[index][0], style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(termsList[index][1],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      height: 2
                                  ),),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                    }

                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
