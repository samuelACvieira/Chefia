import 'package:flutter/material.dart';
import 'tela_cadastro_inst.dart'; // Importa a tela de instituições

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  int pessoas = 2;
  String objetivo = '';
  Set<String> preferencias = {};

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
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "Vamos montar seu perfil\npara termos uma boa experiência",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
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
                    TextField(
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
                            selectedColor: const Color(0xFFB55400),
                            backgroundColor: Colors.white,
                            labelStyle: TextStyle(
                              color: objetivo == "Economizar"
                                  ? Colors.white
                                  : const Color(0xFFB55400),
                            ),
                            onSelected: (selected) {
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
                            selectedColor: const Color(0xFFB55400),
                            backgroundColor: Colors.white,
                            labelStyle: TextStyle(
                              color: objetivo == "Comer saudável"
                                  ? Colors.white
                                  : const Color(0xFFB55400),
                            ),
                            onSelected: (selected) {
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Color(0xFFB55400),
                            ),
                            onPressed: () {
                              setState(() {
                                if (pessoas > 1) pessoas--;
                              });
                            },
                          ),
                          Text(
                            '$pessoas',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB55400),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Color(0xFFB55400),
                            ),
                            onPressed: () {
                              setState(() {
                                pessoas++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Preferências alimentares",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB55400),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildPrefChip("Tudo"),
                        _buildPrefChip("Sem glúten"),
                        _buildPrefChip("Vegano"),
                        _buildPrefChip("Lactose"),
                        _buildPrefChip("Glúten"),
                        _buildPrefChip("0 lactose"),
                      ],
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB55400),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Vamos começar",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Botão “Sou uma instituição” atualizado
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
                        child: const Text(
                          "Sou uma instituição",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB55400),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrefChip(String label) {
    final isSelected = preferencias.contains(label);
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: const Color(0xFFB55400),
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : const Color(0xFFB55400),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onSelected: (selected) {
        setState(() {
          if (selected) {
            preferencias.add(label);
          } else {
            preferencias.remove(label);
          }
        });
      },
    );
  }
}