import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:todo_list_app/security/security_login.dart';
import 'package:get/get.dart';
import 'register_page.dart';
import 'package:todo_list_app/controller/lupa_password_controller.dart';
import 'package:todo_list_app/pages/lupa_password.dart';


class LoginPages extends StatelessWidget {

  //_formKey validasi form
  //  controller → ambil isi input
  // obs → buat UI berubah otomatis (GetX)
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final obscureText = true.obs;

  

  void togglePassword() {
    obscureText.value = !obscureText.value;
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      
      Get.snackbar(
        "Sukses",
        "Login berhasil",
        snackPosition: SnackPosition.BOTTOM,
      );

     
      Get.to(() => HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Selamat Datang",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      // 📧 EMAIL
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: Validasi.validasiEmail,
                      ),

                      SizedBox(height: 15),

                      // 🔒 PASSWORD (pakai Obx)
                      Obx(() => TextFormField(
                            controller: passwordController,
                            obscureText: obscureText.value,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscureText.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: togglePassword,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: Validasi.validasiPassword,
                          )),

                      SizedBox(height: 10),

                      // 🔑 LUPA PASSWORD
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                          Get.to(() => ForgotPasswordPage());
                        },
                        child: Text("Lupa Password?"),
                        ),
                      ),

                      SizedBox(height: 10),

                      // 🔘 LOGIN BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: login,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text("Login"),
                        ),
                      ),

                      SizedBox(height: 15),

                      // 📝 REGISTER
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Belum punya akun? "),
                          InkWell(
                            onTap: () {
                              Get.to(() => RegisterPage());
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}