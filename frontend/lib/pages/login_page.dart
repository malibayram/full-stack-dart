import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: ListView(
            children: [
              const SizedBox(height: 64),
              FormBuilderTextField(
                key: const ValueKey('email'),
                name: 'email',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email Address",
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
                keyboardType: TextInputType.emailAddress,
              ),
              const Divider(),
              FormBuilderTextField(
                key: const ValueKey('password'),
                name: 'password',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6),
                ]),
                obscureText: true,
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  // GoRouter.of(context).go('/');
                  if (formKey.currentState!.saveAndValidate()) {
                    final formValue = formKey.currentState!.value;
                    log(
                      formValue.toString(),
                      name: 'LoginPage Form Values',
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
