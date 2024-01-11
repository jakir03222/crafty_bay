import 'package:crafty_bay/presentation/ui/screens/utitlty/app_colors.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'complete_profile_screen.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(const CompltetProfileScreen());
                      },
                      child: const Text('Next'))),
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
    );
  }
}
