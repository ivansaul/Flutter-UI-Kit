import 'package:flutter/material.dart';
import 'package:flutter_awesome_forms/forms/outline_reactive_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

final form = FormGroup({
  'name': FormControl<String>(
    validators: [
      Validators.required,
      Validators.pattern(r'^[^\d]*$'),
    ],
  ),
  'email': FormControl<String>(
    validators: [
      Validators.required,
      Validators.email,
    ],
  ),
  'password': FormControl<String>(
    validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.pattern(r'[!@#\$%^&*()_+|~\-={}\[\]:;"<>\?,.]', validationMessage: 'specialChar'),
      Validators.pattern(r'\d', validationMessage: 'oneNumber'),
    ],
  ),
});

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e1e23),
      appBar: AppBar(
        title: const Text('Awesome Forms'),
        backgroundColor: const Color(0xff1e1e23),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                const SizedBox(height: 20),
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    final isDirty = formGroup.control('name').dirty;
                    final isValidName = formGroup.control('name').valid;
                    return OutlineReactiveTextField(
                      formControlName: 'name',
                      hintText: 'Fist Name',
                      showErrors: (control) => false,
                      prefixIcon: Icons.person_2_outlined,
                      suffixIcon: (isDirty)
                          ? (isValidName)
                              ? Icons.check_circle_outline_rounded
                              : Icons.dangerous_outlined
                          : null,
                    );
                  },
                ),
                const SizedBox(height: 20),
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    final isDirty = formGroup.control('email').dirty;
                    final isValidName = formGroup.control('email').valid;
                    return OutlineReactiveTextField(
                      formControlName: 'email',
                      hintText: 'Email',
                      showErrors: (control) => false,
                      prefixIcon: Icons.email_outlined,
                      suffixIcon: (isDirty)
                          ? (isValidName)
                              ? Icons.check_circle_outline_rounded
                              : Icons.dangerous_outlined
                          : null,
                    );
                  },
                ),
                const SizedBox(height: 20),
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    return OutlineReactiveTextField(
                      formControlName: 'password',
                      hintText: 'Password',
                      obscureText: true,
                      suffixIconPressable: true,
                      showErrors: (control) => control.touched || control.dirty,
                      prefixIcon: Icons.lock_outline_rounded,
                      suffixIcon: Icons.visibility_outlined,
                    );
                  },
                ),
                const SizedBox(height: 20),
                ReactiveFormConsumer(builder: (context, formGroup, child) {
                  final isFormValid = formGroup.valid;
                  return FilledButton(
                    onPressed: isFormValid ? () => debugPrint('Login ...') : null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
