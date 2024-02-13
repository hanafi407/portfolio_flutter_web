import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_button.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';
import 'package:porfolio_flutter_web/global/app_snackbar.dart';
import 'package:porfolio_flutter_web/global/app_text_style.dart';
import 'package:porfolio_flutter_web/global/app_title.dart';
import 'package:porfolio_flutter_web/widget/responsive_layout.dart';
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailAddresController = TextEditingController();
  final TextEditingController emailSubjectController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<void> sendEmail(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      print('validate');
      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      const String serviceId = 'service_v45ou6a';
      const String templateId = 'template_s11si8k';
      const String publicKey = 'ymgxQEBdKtZofi2cL';
      final response = await http.post(
        url,
        headers: {'Content-Type': "application/json"},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': publicKey,
          'template_params': {
            'user_email': emailAddresController.text,
            'full_name': fullNameController.text,
            'message': messageController.text,
            'mobile_number': mobileNumberController.text,
            'subject': emailSubjectController.text
          }
        }),
      );

      if (response.statusCode == 200) {
        fullNameController.clear();
        emailAddresController.clear();
        emailSubjectController.clear();
        mobileNumberController.clear();
        messageController.clear();

        AppSnackbar.showSnackbar(context, "Sending message is success");
      }else{
        AppSnackbar.showSnackbar(context, "Sending message is failed");
      }

      print(response.statusCode);
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailAddresController.dispose();
    emailSubjectController.dispose();
    mobileNumberController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: buildContactForm(isMobile: true),
      tablet: buildContactForm(),
      desktop: buildContactForm(),
    );
  }

  Widget buildContactForm({bool isMobile = false}) {
    List<Widget> fullnameAndEmail = [
      TextFormField(
        controller: fullNameController,
        style: AppTextStyle.normalStyle(),
        cursorColor: AppColors.textColor,
        decoration: buildInputDecoration(hintText: "Full Name"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Full name is empty";
          }

          return null;
        },
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: emailAddresController,
        style: AppTextStyle.normalStyle(),
        cursorColor: AppColors.textColor,
        decoration: buildInputDecoration(hintText: "Email Address"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Email Address is empty";
          } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
            return 'Please enter a valid email address';
          }

          return null;
        },
      ),
    ];

    List<Widget> mobileNumberAndSubjectEmail = [
      TextFormField(
        controller: mobileNumberController,
        style: AppTextStyle.normalStyle(),
        cursorColor: AppColors.textColor,
        decoration: buildInputDecoration(hintText: "Mobile Number"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Mobile Number is empty";
          }

          return null;
        },
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: emailSubjectController,
        style: AppTextStyle.normalStyle(),
        cursorColor: AppColors.textColor,
        decoration: buildInputDecoration(hintText: "Email Subject"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Email Subject is empty";
          }

          return null;
        },
      ),
    ];
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTitle.buildTitle(name1: "My", name2: "Contact"),
          const SizedBox(height: 15),
          isMobile
              ? Column(
                  children: fullnameAndEmail,
                )
              : Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: fullNameController,
                        style: AppTextStyle.normalStyle(),
                        cursorColor: AppColors.textColor,
                        decoration: buildInputDecoration(hintText: "Full Name "),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Full name is empty";
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: emailAddresController,
                        style: AppTextStyle.normalStyle(),
                        cursorColor: AppColors.textColor,
                        decoration: buildInputDecoration(hintText: "Email Address"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email Address is empty";
                          } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 10),
          isMobile
              ? Column(
                  children: mobileNumberAndSubjectEmail,
                )
              : Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: mobileNumberController,
                        style: AppTextStyle.normalStyle(),
                        cursorColor: AppColors.textColor,
                        decoration: buildInputDecoration(hintText: "Mobile Number"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Mobile Number is empty";
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: emailSubjectController,
                        style: AppTextStyle.normalStyle(),
                        cursorColor: AppColors.textColor,
                        decoration: buildInputDecoration(hintText: "Email Subject"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email Subject is empty";
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 10),
          TextFormField(
            controller: messageController,
            style: AppTextStyle.normalStyle(),
            cursorColor: AppColors.textColor,
            maxLines: 10,
            decoration: buildInputDecoration(hintText: "Your Message"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Message Subject is empty";
              }

              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          AppButton.buildMaterialButton(
            onPressed: () {
              sendEmail(context);
            },
            text: "Send Message",
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hintText,
    double borderRadius = 10,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyle.normalStyle(color: Colors.grey),
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.buttonColor),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      filled: true,
      fillColor: AppColors.bgColor2,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    );
  }
}
