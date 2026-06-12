import 'package:flutter/material.dart';
import '../../database/database_helper.dart';

class TelaEntrada extends StatefulWidget {
  const TelaEntrada({super.key});

  @override
  State<TelaEntrada> createState() => _TelaEntradaState();
}

class _TelaEntradaState extends State<TelaEntrada> {
  final nomeController = TextEditingController();
  final quantidadeController = TextEditingController();
  final validadeController = TextEditingController();

  String tipoSelecionado = "Alimento";

  // 🔥 NOVO: unidade
  String unidadeSelecionada = "kg";

  final List<String> tipos = [
    "Alimento",
    "Hortifruti",
    "Carne",
    "Laticínio",
    "Grãos"
  ];

  // 🔥 NOVO
  final List<String> unidades = ["kg", "L", "unidades"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6D1BA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              const SizedBox(height: 45),

              const Text(
                "Cadastro dos\nalimentos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC46000),
                ),
              ),

              const SizedBox(height: 55),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Nome do alimento:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB54848),
                      ),
                    ),

                    const SizedBox(height: 6),

                    TextField(
                      controller: nomeController,
                      decoration: _dec("ex: macarrão"),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Quantidade:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB54848),
                      ),
                    ),

                    const SizedBox(height: 6),

                    TextField(
                      controller: quantidadeController,
                      keyboardType: TextInputType.number,
                      decoration: _dec("ex: 10"),
                    ),

                    const SizedBox(height: 12),

                    // 🔥 NOVO: UNIDADE
                    const Text(
                      "Unidade:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB54848),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFC97A72),
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: unidadeSelecionada,
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: unidades.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            unidadeSelecionada = value!;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Categoria:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB54848),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFC97A72),
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: tipoSelecionado,
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: tipos.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            tipoSelecionado = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7900),
                  ),
                  onPressed: () async {
                    await DatabaseHelper.instance.inserirItemEstoque({
                      "nome": nomeController.text,
                      "quantidade": quantidadeController.text,
                      "tipo": unidadeSelecionada, // 🔥 aqui entra kg/L/unidade
                      "validade": "",
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Alimento Adicionado"),
                      ),
                    );

                    nomeController.clear();
                    quantidadeController.clear();
                  },
                  child: const Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _dec(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFEDEDED),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}