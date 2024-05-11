import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/utils.dart';
import '../widgets/text_field_with_label.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController masterPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController siteDomainController = TextEditingController();

  String? resultPassword;
  bool showPassword = false;
  int passwordLength = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GhostPass"),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWithLabel(
                label: "Master Password",
                controller: masterPasswordController,
                isPassword: true,
                onChanged: (v) => resetPassword(),
              ),
              const SizedBox(height: 20),
              TextFieldWithLabel(
                label: "Username",
                controller: usernameController,
                onChanged: (v) => resetPassword(),
              ),
              const SizedBox(height: 20),
              TextFieldWithLabel(
                label: "Site Domain",
                controller: siteDomainController,
                onChanged: (v) => resetPassword(),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    resultPassword = getPassword(
                      masterPasswordController.text,
                      usernameController.text,
                      siteDomainController.text,
                    );
                  });
                },
                child: const Text("Generate Password"),
              ),
              const SizedBox(height: 30),
              Visibility(
                visible: resultPassword != null,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: resultPassword ?? ""));
                          Fluttertoast.showToast(
                              msg: "Password copied to clipboard");
                        },
                        child: const Text("Copy Password")),
                    const SizedBox(height: 20),
                    SelectableText(
                        showPassword ? (resultPassword ?? "") : "*" * 10),
                    Wrap(children: [
                      CheckboxListTile(
                          title: const Text("Show"),
                          value: showPassword,
                          onChanged: (value) => setState(() {
                                showPassword = value ?? false;
                              }))
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void resetPassword() {
    setState(() {
      resultPassword = null;
    });
  }
}
