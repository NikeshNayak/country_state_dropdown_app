import 'package:flutter/material.dart';

const String baseUrl = "https://fedt.unruffledneumann.xyz/api/v1";
const String xAPIKey = "rLn*xzeZ%U+(PRuK%:v@C(a3j=<.[TWX(F^,EDrv";

void showSnackMessage({required BuildContext context, required String title, required String text, required IconData icon, Color color = Colors.red, int seconds = 2, bool isFloating = true}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      behavior: isFloating ? SnackBarBehavior.floating : null,
      shape: isFloating ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)) : null,
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.white.withValues(alpha: 0.5),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      backgroundColor: color,
      duration: Duration(seconds: seconds),
    ),
  );
}
