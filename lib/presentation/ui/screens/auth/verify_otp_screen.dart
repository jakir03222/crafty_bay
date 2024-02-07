import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/app_colors.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'complete_profile_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  const VerifyOtpScreen({
    super.key,
    required this.email,
  });

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _otpTEdController = TextEditingController();
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
                const SizedBox(height: 100),
                const AppLogo(height: 80),
                const SizedBox(height: 24.0),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'A 4 digit OTP has been sent',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16.0),
                PinCodeTextField(
                  controller: _otpTEdController,
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: AppColors.primoryColor,
                      selectedFillColor: Colors.transparent),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                    width: double.infinity,
                    child: GetBuilder<VerifyOTPController>(
                      builder: (verifyOTPController) => Visibility(
                        visible: verifyOTPController.isProgress == false,
                        replacement: const CenterCircularProgressIndicator(),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_fromKey.currentState!.validate()) {
                                final bool response =
                                    await verifyOTPController.verifyOTP(
                                        widget.email, _otpTEdController.text);
                                if (response) {
                                  if (verifyOTPController
                                      .shouldNavigateCompleteProfile) {
                                    Get.to(const CompltetProfileScreen());
                                  } else {
                                    Get.offAll(
                                        () => const MainBottonNavScreen());
                                  }
                                } else {
                                  Get.showSnackbar(GetSnackBar(
                                    title: "OTP Verifiacation falled",
                                    message: verifyOTPController.errormassage,
                                    isDismissible: true,
                                    duration: const Duration(seconds: 2),
                                  ));
                                }
                              }
                            },
                            child: const Text('Next')),
                      ),
                    )),
                const SizedBox(height: 24.0),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        children: [
                      TextSpan(text: "This code will expire"),
                      TextSpan(
                          style: TextStyle(
                              color: AppColors.primoryColor,
                              fontWeight: FontWeight.w600),
                          text: "120")
                    ])),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend Coed",
                      style: TextStyle(color: Colors.grey),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
