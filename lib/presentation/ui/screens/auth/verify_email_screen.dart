import 'package:crafty_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'verify_otp_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailTEControler = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                const SizedBox(height: 160),
                const AppLogo(height: 80),
                const SizedBox(height: 24.0),
                Text(
                  'Welcomw Backe',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Plases enter your email address',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailTEControler,
                  decoration: const InputDecoration(hintText: "Email"),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your email";
                    }

                    // ToDo Validote email with Regex
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                GetBuilder<SendEmailOtpController>(
                  builder: (controller) => SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: controller.inProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_fromKey.currentState!.validate()) {
                                final bool result =
                                    await controller.sendOtpEmail(
                                        _emailTEControler.text.trim());
                                if (result) {
                                  Get.to(() => const VerifyOtpScreen());
                                } else {
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      title: "Send otp Faild",
                                      message: controller.errorMessage,
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text('Next')),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
