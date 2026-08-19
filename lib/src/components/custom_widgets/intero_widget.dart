import 'package:flutter/material.dart';
import 'package:portfolio/src/components/custom_widgets/black-text.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({super.key});

  @override
  State<IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Column(
      children: [
        if (Responsive.isMobile)
          Container()
        else
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 80),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Main Heading
                      const BlackText(
                        text: "Hi, I am Arslan,\nMobile App Developer",
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        textColor: Color(0xFF21243D),
                        height: 1.3,
                      ),
                      const SizedBox(height: 24),

                      // Description Subtitle
                      const BlackText(
                        text:
                        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. "
                            "Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xFF21243D),
                        height: 1.5,
                      ),
                      const SizedBox(height: 38),

                      // Download Resume Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.red,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: BlackText(
                          text: "Download Resume",
                          fontSize: 14,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 60),

                // Right Side: Profile Picture with Shadow
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFEDF7FA).withValues(alpha: 0.8),
                            blurRadius: 0,
                            offset: const Offset(-8, 12),
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage("assets/profile.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}