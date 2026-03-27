import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/security/security_login.dart';

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final obscurePassword = true.obs;
  final obscureConfirm = true.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirm() {
    obscureConfirm.value = !obscureConfirm.value;
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      Get.snackbar(
        "Sukses",
        "Akun berhasil dibuat",
        snackPosition: SnackPosition.BOTTOM,
      );

      // balik ke login
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
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
                        "Buat Akun",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      // 👤 NAMA
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Nama",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama wajib diisi";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

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

                      // 🔒 PASSWORD
                      Obx(() => TextFormField(
                            controller: passwordController,
                            obscureText: obscurePassword.value,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscurePassword.value
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

                      SizedBox(height: 15),

                      // 🔒 CONFIRM PASSWORD
                      Obx(() => TextFormField(
                            controller: confirmPasswordController,
                            obscureText: obscureConfirm.value,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscureConfirm.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: toggleConfirm,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Konfirmasi password wajib diisi";
                              }
                              if (value != passwordController.text) {
                                return "Password tidak sama";
                              }
                              return null;
                            },
                          )),

                      SizedBox(height: 20),

                      // 🔘 REGISTER BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: register,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text("Register"),
                        ),
                      ),

                      SizedBox(height: 15),

                      // 🔙 KE LOGIN
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sudah punya akun? "),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              "Login",
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