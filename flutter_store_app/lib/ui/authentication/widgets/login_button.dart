import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthCustomButtonWidget extends StatelessWidget {
  final String labelText;
  final VoidCallback? onTap;
  const AuthCustomButtonWidget({
    Key? key,
    required this.labelText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 319,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: [
              Color(0xff102de1),
              Color(0xCC0d6eff),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 278,
              top: 19,
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 12,
                      color: Color(0xff103de5),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 311,
              top: 36,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  width: 5,
                  height: 5,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 3),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 281,
              top: -10,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  width: 20,
                  height: 20,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 3),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                labelText,
                style: GoogleFonts.getFont(
                  'Lato',
                  fontSize: 17,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
