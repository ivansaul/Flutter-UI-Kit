import 'package:flutter/material.dart';
import 'package:flutter_template/ui/screens/home_screen.dart';
import 'package:flutter_template/ui/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 70;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              'https://i.imgur.com/LncodO3.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(painter: _ShapePainter()),
          ),
          Positioned(
            bottom: 45,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Let's Enjoy The Beautiful World",
                  style: GoogleFonts.roboto(
                    color: Colors.black87,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  "Explore new places in the wold and get new experiences.",
                  style: GoogleFonts.roboto(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      letterSpacing: 0.1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 35),
                CustomFilledButton(
                  width: double.infinity,
                  height: buttonHeight,
                  borderRadius: buttonHeight,
                  color: const Color(0xffF88E54),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: buttonHeight - 10,
                        width: buttonHeight - 10,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_double_arrow_right_rounded,
                          color: Color(0xffF88E54),
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * 0.6)
      ..lineTo(0, size.height * 0.55)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
