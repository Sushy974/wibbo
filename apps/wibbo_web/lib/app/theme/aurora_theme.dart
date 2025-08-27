import 'package:flutter/material.dart';

/// Thème personnalisé inspiré des aurores boréales
class AuroraTheme {
  // Couleurs principales
  static const Color primaryGreen = Color(0xFF2D6A4F);
  static const Color lightGreen = Color(0xFF52B788);
  static const Color darkGreen = Color(0xFF1B4332);
  static const Color emeraldGreen = Color(0xFF40916C);
  static const Color tealGreen = Color(0xFF74C69D);
  static const Color accentGreen = Color(0xFF4CAF50);
  static const Color lightAccentGreen = Color(0xFF81C784);
  static const Color tealAccent = Color(0xFF26A69A);
  static const Color lightTealAccent = Color(0xFF4DB6AC);
  static const Color starYellow = Color(0xFFF4D03F);
  static const Color inputBackground = Color(0xFFE8F5E8);

  // Dégradés
  static const LinearGradient auroraGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      darkGreen,
      primaryGreen,
      emeraldGreen,
      lightGreen,
      tealGreen,
    ],
    stops: [0.0, 0.25, 0.5, 0.75, 1.0],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      lightGreen,
      primaryGreen,
    ],
  );

  static const LinearGradient auroraBand1 = LinearGradient(
    colors: [accentGreen, lightAccentGreen],
  );

  static const LinearGradient auroraBand2 = LinearGradient(
    colors: [tealAccent, lightTealAccent],
  );

  /// Créer le thème principal
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryGreen,
      onPrimary: Colors.white,
      secondary: lightGreen,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: darkGreen,
      surface: Colors.white,
      onSurface: darkGreen,
      surfaceVariant: inputBackground,
      onSurfaceVariant: primaryGreen,
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        elevation: 8,
        shadowColor: primaryGreen.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryGreen,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: primaryGreen, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.red),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      hintStyle: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 16,
      ),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),

    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryGreen;
        }
        return Colors.transparent;
      }),
      checkColor: MaterialStateProperty.all(Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),

    // Text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: darkGreen,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: darkGreen,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: darkGreen,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: darkGreen,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: darkGreen,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: darkGreen,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: primaryGreen,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: primaryGreen,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: primaryGreen,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: darkGreen,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: darkGreen,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: darkGreen,
        fontSize: 12,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: primaryGreen,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        color: primaryGreen,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  /// Widget pour l'arrière-plan avec aurores boréales
  static Widget auroraBackground({
    required Widget child,
    bool showStars = true,
    bool showMountains = true,
  }) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: auroraGradient,
      ),
      child: Stack(
        children: [
          // Arrière-plan avec aurores boréales
          Positioned.fill(
            child: CustomPaint(
              painter: AuroraPainter(),
            ),
          ),

          // Étoiles
          if (showStars) ...List.generate(20, (index) => _buildStar(index)),

          // Montagnes en bas
          if (showMountains)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomPaint(
                painter: MountainPainter(),
                size: Size(double.infinity, 150),
              ),
            ),

          // Contenu principal
          child,
        ],
      ),
    );
  }

  /// Widget pour les champs de saisie stylisés
  static Widget auroraInputField({
    required BuildContext context,
    required IconData icon,
    required String hintText,
    required bool enabled,
    bool obscureText = false,
    String? errorText,
    required ValueChanged<String> onChanged,
    TextInputType? keyboardType,
    List<String>? autofillHints,
    TextInputAction? textInputAction,
    Function(String)? onSubmitted,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: errorText != null ? Colors.red : Colors.grey.shade300,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        enabled: enabled,
        obscureText: obscureText,
        keyboardType: keyboardType,
        autofillHints: autofillHints,
        textInputAction: textInputAction,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 16,
          ),
          errorText: errorText,
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: inputBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: primaryGreen,
              size: 20,
            ),
          ),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }

  /// Widget pour les boutons avec dégradé
  static Widget auroraGradientButton({
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    double height = 50,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: buttonGradient,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: primaryGreen.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  /// Widget pour les boutons de téléchargement
  static Widget auroraDownloadButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryGreen,
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: primaryGreen,
                size: 16,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget pour les étoiles
  static Widget _buildStar(int index) {
    final random = index * 123.456;
    final x = (random * 100) % 400; // Largeur approximative
    final y = (random * 200) % 600; // Hauteur approximative

    return Positioned(
      left: x.toDouble(),
      top: y.toDouble(),
      child: Container(
        width: 3,
        height: 3,
        decoration: BoxDecoration(
          color: starYellow,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: starYellow.withOpacity(0.8),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
      ),
    );
  }
}

// Peintre pour les aurores boréales
class AuroraPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Première bande d'aurore
    final auroraPath = Path();
    auroraPath.moveTo(0, size.height * 0.2);
    auroraPath.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.1,
      size.width * 0.6,
      size.height * 0.15,
    );
    auroraPath.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.2,
      size.width,
      size.height * 0.25,
    );

    paint.shader = AuroraTheme.auroraBand1.createShader(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );

    canvas.drawPath(
      auroraPath,
      paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 20,
    );

    // Deuxième bande d'aurore
    final auroraPath2 = Path();
    auroraPath2.moveTo(0, size.height * 0.3);
    auroraPath2.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.25,
      size.width * 0.7,
      size.height * 0.3,
    );
    auroraPath2.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.35,
      size.width,
      size.height * 0.4,
    );

    paint.shader = AuroraTheme.auroraBand2.createShader(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );

    canvas.drawPath(
      auroraPath2,
      paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 15,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Peintre pour les montagnes
class MountainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);

    // Première montagne
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.3,
      size.width * 0.4,
      size.height * 0.6,
    );

    // Deuxième montagne
    path.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.4,
      size.width * 0.8,
      size.height * 0.6,
    );

    // Troisième montagne
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.5,
      size.width,
      size.height * 0.7,
    );

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
