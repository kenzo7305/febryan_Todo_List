class Validasi {
  // 📧 VALIDASI EMAIL
  static String? validasiEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email wajib diisi";
    }
    if (!value.contains("@gmail.com")) {
      return "Harus pakai @gmail.com";
    }
    return null;
  }

  // 🔒 VALIDASI PASSWORD
  static String? validasiPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password wajib diisi";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Harus ada huruf kapital";
    }

    if (!RegExp(r'[!@#\$%^&*(),.?\":{}|<>]').hasMatch(value)) {
      return "Harus ada simbol (!@# dll)";
    }

    return null;
  }
}