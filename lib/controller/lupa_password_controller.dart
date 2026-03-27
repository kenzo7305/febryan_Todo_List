import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();

  var isOtpSent = false.obs;
  var isOtpVerified = false.obs; //  tambahan
  var generatedOtp = "".obs;
  var isLoading = false.obs;

  //  KIRIM OTP
  void sendOtp() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      Future.delayed(Duration(seconds: 2), () {
        String otp = (100000 + Random().nextInt(900000)).toString();
        generatedOtp.value = otp;

        isOtpSent.value = true;
        isLoading.value = false;

        Get.snackbar("OTP", "Kode OTP: $otp");
      });
    }
  }

  //  VERIFIKASI OTP
  void verifyOtp() {
    if (otpController.text == generatedOtp.value) {
      isOtpVerified.value = true; // ✅ baru bisa lanjut

      Get.snackbar("Sukses", "OTP benar");
    } else {
      Get.snackbar("Error", "OTP salah");
    }
  }

  //  RESET PASSWORD
  void resetPassword() {
    if (!isOtpVerified.value) {
      Get.snackbar("Error", "Verifikasi OTP dulu");
      return;
    }

    if (newPasswordController.text.isEmpty) {
      Get.snackbar("Error", "Password wajib diisi");
      return;
    }

    Get.snackbar("Sukses", "Password berhasil diubah");
    Get.back();
  }
}