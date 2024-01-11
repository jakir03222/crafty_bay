import 'package:crafty_bay/presentation/ui/screens/utitlty/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verify_otp_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(const VerifyOtpScreen());
                      },
                      child: const Text('Next')))
            ],
          ),
        ),
      ),
    );
  }
}
