import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompltetProfileScreen extends StatelessWidget {
  const CompltetProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const AppLogo(height: 80),
              const SizedBox(height: 24.0),
              Text(
                'Complet Profile',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Get started with us profile',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "First Name"),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "Last Name"),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Mobile"),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "City"),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                textInputAction: TextInputAction.done,
                maxLines: 4,
                decoration: const InputDecoration(hintText: "Shipping address"),
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(const MainBottonNavScreen());
                      },
                      child: const Text('Complete')))
            ],
          ),
        ),
      ),
    );
  }
}
