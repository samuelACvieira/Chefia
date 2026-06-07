import 'package:flutter/material.dart';

class CadastroInstituicao extends StatefulWidget {
  const CadastroInstituicao({super.key});

  @override
  State<CadastroInstituicao> createState() => _CadastroInstituicaoState();
}

class _CadastroInstituicaoState extends State<CadastroInstituicao> {
  final nomeInstController = TextEditingController();
  final tipoController = TextEditingController();
  final responsavelController = TextEditingController();
  final cargoController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneController = TextEditingController();

  final List<String> tipos = ['ONG', 'Escola', 'Abrigo', 'Empresa', 'Outra'];
  String tipoSelecionado = 'Escola';

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
                gradient: const LinearGradient(
                  colors: [Color(0xFFB55400), Color(0xFFF4A261)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
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
                        "Cadastro Instituição",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB55400),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "Nome da Instituição",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB55400),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: nomeInstController,
                      decoration: InputDecoration(
                        hintText: "Digite o nome",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),

                    const SizedBox(height: 15),
                    const Text(
                      "Tipo da Instituição",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB55400),
                      ),
                    ),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: tipoSelecionado,
                      items: tipos.map((tipo) => DropdownMenuItem(
                        value: tipo,
                        child: Text(tipo),
                      )).toList(),
                      onChanged: (value) {
                        setState(() {
                          tipoSelecionado = value!;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),

                    const SizedBox(height: 15),
                    const Text(
                      "Contato Principal",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB55400),
                      ),
                    ),
                    const SizedBox(height: 6),

                    TextField(
                      controller: responsavelController,
                      decoration: InputDecoration(
                        hintText: "Nome do responsável",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                    const SizedBox(height: 12),

                    TextField(
                      controller: cargoController,
                      decoration: InputDecoration(
                        hintText: "Cargo/função",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                    const SizedBox(height: 12),

                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                    const SizedBox(height: 12),

                    TextField(
                      controller: telefoneController,
                      decoration: InputDecoration(
                        hintText: "Telefone",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),

                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // Salvar dados da instituição
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB55400),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Cadastrar Instituição",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
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