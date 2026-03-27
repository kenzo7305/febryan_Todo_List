import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controller/lupa_password_controller.dart';
import 'package:todo_list_app/security/security_login.dart';

class ForgotPasswordPage extends StatelessWidget {
  final controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lupa Password")),
      body: Center( //  BIAR DI TENGAH
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min, //  BIAR KE TENGAH
                  children: [

                    //  EMAIL
                    if (!controller.isOtpSent.value) ...[
                      TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: Validasi.validasiEmail,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: controller.sendOtp,
                        child: Text("Kirim OTP"),
                      ),
                    ],

                   // OTP
                    if (controller.isOtpSent.value &&
                        !controller.isOtpVerified.value) ...[
                      Text(
                        "Masukkan OTP yang dikirim ke email",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: controller.otpController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          labelText: "OTP",
                          border: OutlineInputBorder(),
                          counterText: "",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "OTP wajib diisi";
                          }
                          if (value.length != 6) {
                            return "OTP harus 6 digit";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.verifyOtp();
                          }
                        },
                        child: Text("Verifikasi OTP"),
                      ),
                    ],

                   // PASSWORD BARU
                    if (controller.isOtpVerified.value) ...[
                      Text(
                        "Masukkan Password Baru",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: controller.newPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password Baru",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                        validator: Validasi.validasiPassword,
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.resetPassword();
                          }
                        },
                        child: Text("Reset Password"),
                      ),
                    ],
                  ],
                )),
          ),
        ),
      ),
    );
  }
}