import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OutlineReactiveTextField extends HookWidget {
  final String? formControlName;
  final String? label;
  final String? errorText;
  final void Function(String value)? onChanged;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final IconData selectedSuffixIcon;
  final bool obscureText;
  final String? hintText;
  final Map<String, String Function(Object)>? validationMessages;
  final bool Function(FormControl<Object?> control)? showErrors;
  final TextInputType? keyboardType;
  final bool isDense;
  final bool suffixIconPressable;
  final bool filled;
  final Color fillColor = const Color(0xff3E3D40);

  const OutlineReactiveTextField({
    super.key,
    this.formControlName,
    this.label,
    this.errorText,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.selectedSuffixIcon = Icons.visibility_off_outlined,
    this.obscureText = false,
    this.hintText,
    this.validationMessages,
    this.showErrors,
    this.keyboardType,
    this.isDense = true,
    this.filled = true,
    this.suffixIconPressable = false,
  });

  @override
  Widget build(BuildContext context) {
    final isObscureted = useState(obscureText);

    const radious = 15.0;

    final errorStyle = GoogleFonts.poppins(
      color: Colors.redAccent,
      fontSize: 15,
    );

    final style = GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 15,
    );

    final enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radious),
      borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radious),
      borderSide: const BorderSide(color: Color(0xff636063), width: 2),
    );

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radious),
      borderSide: BorderSide(color: Colors.red.shade900, width: 2),
    );

    final focusedErrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radious),
      borderSide: BorderSide(color: Colors.red.shade900, width: 2),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReactiveTextField(
          formControlName: formControlName,
          cursorHeight: 18,
          style: style,
          cursorColor: Colors.white,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
            ),
            isDense: isDense,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorText: errorText,
            errorStyle: errorStyle,
            errorBorder: errorBorder,
            focusedErrorBorder: focusedErrorBorder,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
            ),
            prefixIcon: Icon(prefixIcon),
            prefixIconColor: Colors.white,
            suffixIconColor: Colors.white,
            suffixIcon: suffixIconPressable
                ? Material(
                    color: Colors.transparent,
                    child: IconButton(
                      splashRadius: 20,
                      onPressed: () => isObscureted.value = !isObscureted.value,
                      icon: Icon(isObscureted.value ? suffixIcon : selectedSuffixIcon),
                    ),
                  )
                : Icon(suffixIcon),
            filled: filled,
            fillColor: fillColor,
          ),
          validationMessages: validationMessages,
          obscureText: isObscureted.value,
          showErrors: showErrors,
        ),
      ],
    );
  }
}
