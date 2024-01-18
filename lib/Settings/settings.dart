import 'package:flutter/material.dart';
import 'package:horus_frontend/Components/appbar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isLightThemeSwitched = true;
  bool isEnableLocationShare = true;
  String dropDownFontValue = "30";

  var fontItems = ['10', '20', '30', '40', '50'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Settings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: myCustomAppBar().actions),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFF1F1F1),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Row(
                  children: [
                    Icon(isLightThemeSwitched
                        ? Icons.brightness_6
                        : Icons.contrast),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      isLightThemeSwitched ? "Light Theme" : "Dark Theme",
                      style:
                          const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const Expanded(child: SizedBox()),
                    Switch(
                        activeColor: const Color(0xFFFDB827),
                        value: isLightThemeSwitched,
                        onChanged: (value) {
                          setState(() {
                            isLightThemeSwitched = value;
                          });
                        })
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFF1F1F1),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "Enable Location Share?",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const Expanded(child: SizedBox()),
                    Switch(
                        activeColor: const Color(0xFFFDB827),
                        value: isEnableLocationShare,
                        onChanged: (value) {
                          setState(() {
                            isEnableLocationShare = value;
                          });
                        })
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFF1F1F1),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Row(
                  children: [
                    const Icon(Icons.format_size),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "Font Size",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const Expanded(child: SizedBox()),
                    DropdownButton(
                      value: dropDownFontValue,
                      items: fontItems.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownFontValue = newValue!;
                        });
                      },
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
}
