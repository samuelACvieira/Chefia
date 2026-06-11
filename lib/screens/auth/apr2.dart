import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF47C20),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            // Ilustração
            SizedBox(
              height: 250,
              width: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Transform.rotate(
                      angle: 0.25,
                      child: Container(
                        width: 170,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF39A52),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 30,
                            height: 12,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB36A2D),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 40,
                    child: Container(
                      width: 190,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF39A52),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 110,
                    child: Container(
                      width: 170,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color(0xFF665B60),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 10,
                    bottom: 95,
                    child: Transform.rotate(
                      angle: -0.5,
                      child: Container(
                        width: 25,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF39A52),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    right: 10,
                    bottom: 95,
                    child: Transform.rotate(
                      angle: 0.5,
                      child: Container(
                        width: 25,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF39A52),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Bem-vindo ao Chef",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "IA",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B3D00),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                "Onde a inteligência artificial encontra o sabor da sua cozinha, de forma consciente.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.95),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),

            const Spacer(),

            // BOTÃO CORRIGIDO (NAVEGAÇÃO)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/apr2');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB067),
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Vamos começar",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _dot(true),
                const SizedBox(width: 8),
                _dot(false),
                const SizedBox(width: 8),
                _dot(false),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget _dot(bool active) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFF9C4D00)
            : Colors.white.withOpacity(0.7),
        shape: BoxShape.circle,
      ),
    );
  }
}