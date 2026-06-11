import 'package:flutter/material.dart';
import 'tela_cadastro_inst.dart';
import 'apr1.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  int pessoas = 2;
  String objetivo = '';
  Set<String> preferencias = {};

  // ✅ NOVO: controller do nome
  final TextEditingController nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDCFA1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFB55400),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBE2C4),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "Crie seu perfil",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB55400),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Nome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB55400),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ✅ ALTERADO: agora usa controller
                    TextField(
                      controller: nomeController,
                      decoration: InputDecoration(
                        hintText: "Digite seu nome",
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      "Objetivo Principal",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB55400),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: ChoiceChip(
                            label: const Text("Economizar"),
                            selected: objetivo == "Economizar",
                            onSelected: (_) {
                              setState(() {
                                objetivo = "Economizar";
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ChoiceChip(
                            label: const Text("Comer saudável"),
                            selected: objetivo == "Comer saudável",
                            onSelected: (_) {
                              setState(() {
                                objetivo = "Comer saudável";
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      "Quantas pessoas moram na sua casa?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB55400),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (pessoas > 1) pessoas--;
                            });
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          "$pessoas",
                          style: const TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              pessoas++;
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),

                    const SizedBox(height: 35),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB55400),
                        ),

                        // 🔥 AQUI FOI A PRINCIPAL MUDANÇA
                        onPressed: () {
                          if (nomeController.text.isEmpty || objetivo.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Preencha nome e objetivo"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OnboardingScreen(),
                            ),
                          );
                        },

                        child: const Text(
                          "Vamos começar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CadastroInstituicao(),
                            ),
                          );
                        },
                        child: const Text("Sou uma instituição"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}