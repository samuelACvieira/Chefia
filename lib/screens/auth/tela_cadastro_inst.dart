import 'package:flutter/material.dart';
import '../../database/database_helper.dart';
import 'apr1.dart';

class CadastroInstituicao extends StatefulWidget {
  const CadastroInstituicao({super.key});

  @override
  State<CadastroInstituicao> createState() => _CadastroInstituicaoState();
}

class _CadastroInstituicaoState extends State<CadastroInstituicao> {
  final nomeInstController = TextEditingController();
  final responsavelController = TextEditingController();
  final cargoController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneController = TextEditingController();

  final List<String> tipos = ['ONG', 'Escola', 'Abrigo', 'Empresa', 'Outra'];
  String tipoSelecionado = 'Escola';

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFFB55400),
        ),
      ),
    );
  }

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

                    _label("Nome da Instituição"),
                    TextField(
                      controller: nomeInstController,
                      decoration: _inputDecoration("Digite o nome"),
                    ),

                    const SizedBox(height: 15),

                    _label("Tipo da Instituição"),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: DropdownButton<String>(
                        value: tipoSelecionado,
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: tipos.map((tipo) {
                          return DropdownMenuItem(
                            value: tipo,
                            child: Text(tipo),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            tipoSelecionado = value!;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 15),

                    _label("Responsável"),
                    TextField(
                      controller: responsavelController,
                      decoration: _inputDecoration("Nome do responsável"),
                    ),

                    const SizedBox(height: 10),

                    _label("Cargo"),
                    TextField(
                      controller: cargoController,
                      decoration: _inputDecoration("Cargo/função"),
                    ),

                    const SizedBox(height: 10),

                    _label("E-mail"),
                    TextField(
                      controller: emailController,
                      decoration: _inputDecoration("E-mail"),
                    ),

                    const SizedBox(height: 10),

                    _label("Telefone"),
                    TextField(
                      controller: telefoneController,
                      decoration: _inputDecoration("Telefone"),
                    ),

                    const SizedBox(height: 25),

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
                        onPressed: () async {
  try {
    await DatabaseHelper.instance.inserirInstituicao({
      'nome': nomeInstController.text,
      'tipo': tipoSelecionado,
      'responsavel': responsavelController.text,
      'cargo': cargoController.text,
      'email': emailController.text,
      'telefone': telefoneController.text,
    });

    // 🔥 DEBUG DO BANCO (volta a funcionar)
    final dados = await DatabaseHelper.instance.listarInstituicoes();
    print("📦 DADOS DO BANCO:");
    print(dados);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Instituição cadastrada com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnboardingScreen(),
      ),
    );

  } catch (e) {
    print("❌ ERRO NO CADASTRO: $e");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro: $e'),
        backgroundColor: Colors.red,
      ),
    );
  }
},
                        child: const Text(
                          "Cadastrar Instituição",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
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