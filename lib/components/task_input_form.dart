
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortpoint_todo_app/components/space_widget.dart';

import 'app_colors.dart';







class FormTextField extends StatefulWidget {
  final String labelText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Function(String) validator;
  final bool isPassWordField;
  final String hintText;
  final Color errorBorder;
  final Color focusErrorBorder;
  final TextEditingController controller;
  final bool addMargin;
  final Color fillcolor;
  final errortxtclr;
  final String? errortxt;
  final int? maxLength;
  final readOnly;
  final bool isEdu;
  final Function(String) onChange;
  final String headerText;


  const FormTextField({super.key,
    this.labelText = "",
    required this.textInputAction,
    this.addMargin = true,
    this.textInputType = TextInputType.name,
    this.hintText = "",
    this.isPassWordField = false,
    this.textCapitalization = TextCapitalization.words,
    required this.validator,
    required this.controller,
    this.errorBorder = Colors.red,
    this.focusErrorBorder = Colors.red,
    this.fillcolor = greyColor,
    this.errortxtclr = Colors.red,
    this.readOnly = false,
    this.isEdu = false,
    this.errortxt,
    required this.headerText,
    required this.onChange,
    this.maxLength,
  });

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool _obscureText = true;

  FocusNode _focusNode = FocusNode();

  // Adds initialization and disposal to _focusNode
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // Toggles the password visibility
  void _toggle() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    var passwordVisibilityToggle = GestureDetector(
      onTap: _toggle,
      child: Container(
        width: 48,
        height: 69,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(width: 1, color: Colors.transparent),
          ),
        ),
        margin: const EdgeInsets.only(left: 14.0),
        child: Center(
          child: GestureDetector(
            onTap: _toggle,
            child: FaIcon(
              _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
              size: 14,
              color: greyColor,
            ),
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headerText,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        const VSpace(6),
        TextFormField(
          //readOnly: widget.readOnly,
          focusNode: _focusNode,
          onTap: _requestFocus,
          cursorWidth: 1.8,
          cursorHeight: 18,
          cursorColor: Colors.black,
          controller: widget.controller,
          textCapitalization: widget.textCapitalization,
          keyboardAppearance: Brightness.light,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          onChanged: widget.onChange,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            errorText: widget.errortxt,
            counter: const SizedBox(),
            //alignLabelWithHint: true,
            contentPadding: const EdgeInsets.only(left: 12, right: 12),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: .1,
              ),
            ),
            // hintStyle: TextStyle(
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide(color: widget.focusErrorBorder, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide(color: widget.errorBorder, width: 1.5),
            ),
            errorStyle: GoogleFonts.roboto(fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide:  const BorderSide(color: Colors.grey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide:  const BorderSide(color: greyColor, width: 1.5),
            ),
            hintText: widget.hintText,
            //labelText: widget.labelText,
            // labelStyle: TextStyle(
            //floatingLabelBehavior: FloatingLabelBehavior.never,
            // fillColor: Colors.red,
            suffixIcon: widget.isPassWordField
                ? passwordVisibilityToggle
                : widget.isEdu
                ? const Icon(
              Icons.arrow_drop_down_outlined,
              size: 18,
            )
                : null,
          ),
          autofocus: false,
          obscureText: widget.isPassWordField ? _obscureText : false,
        ),
      ],
    );
  }
}




//for phone number input
class FormTextField2 extends StatefulWidget {
  final String labelText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Function(String) validator;
  final bool isPassWordField;
  final String hintText;
  final Color errorBorder;
  final Color focusErrorBorder;
  final TextEditingController controller;
  final bool addMargin;
  final Color fillcolor;
  final errortxtclr;
  final String? errortxt;
  final int? maxLength;
  final readOnly;
  final bool isEdu;
  final Function(String) onChange;
  final String headerText;
  final Widget prefixIcon;

  const FormTextField2({super.key,
    this.labelText = "",
    required this.textInputAction,
    this.addMargin = true,
    this.textInputType = TextInputType.name,
    this.hintText = "",
    this.isPassWordField = false,
    this.textCapitalization = TextCapitalization.words,
    required this.validator,
    required this.controller,
    this.errorBorder = Colors.red,
    this.focusErrorBorder = Colors.red,
    this.fillcolor = greyColor,
    this.errortxtclr = Colors.red,
    this.readOnly = false,
    this.isEdu = false,
    this.errortxt,
    required this.headerText,
    required this.onChange,
    this.maxLength,
    required this.prefixIcon,
  });

  @override
  _FormTextField2State createState() => _FormTextField2State();
}

class _FormTextField2State extends State<FormTextField2> {
  bool _obscureText = true;

  FocusNode _focusNode = FocusNode();

  // Adds initialization and disposal to _focusNode
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // Toggles the password visibility
  void _toggle() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    var passwordVisibilityToggle = GestureDetector(
      onTap: _toggle,
      child: Container(
        width: 48,
        height: 44,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(width: 1, color: Colors.transparent),
          ),
        ),
        margin: const EdgeInsets.only(left: 14.0),
        child: Center(
          child: GestureDetector(
            onTap: _toggle,
            child: FaIcon(
              _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
              size: 14,
              color: greyColor,
            ),
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headerText,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        const VSpace(6),
        TextFormField(
          //readOnly: widget.readOnly,
          focusNode: _focusNode,
          onTap: _requestFocus,
          cursorWidth: 1.8,
          cursorHeight: 18,
          cursorColor: Colors.black,
          controller: widget.controller,
          textCapitalization: widget.textCapitalization,
          keyboardAppearance: Brightness.light,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          onChanged: widget.onChange,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            errorText: widget.errortxt,
            counter: const SizedBox(),
            //alignLabelWithHint: true,
            contentPadding: const EdgeInsets.only(left: 12, right: 12),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: .1,
              ),
            ),
            // hintStyle: TextStyle(
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: widget.focusErrorBorder, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: widget.errorBorder, width: 1.5),
            ),
            errorStyle: GoogleFonts.dmSans(fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:  const BorderSide(color: Colors.grey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:  const BorderSide(color: greyColor, width: 1.5),
            ),
            hintText: widget.hintText,
            //labelText: widget.labelText,
            // labelStyle: TextStyle(
            //floatingLabelBehavior: FloatingLabelBehavior.never,
            // fillColor: Colors.red,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassWordField
                ? passwordVisibilityToggle
                : widget.isEdu
                ? const Icon(
              Icons.arrow_drop_down_outlined,
              size: 18,
            )
                : null,
          ),
          autofocus: false,
          obscureText: widget.isPassWordField ? _obscureText : false,
        ),
      ],
    );
  }
}