import 'package:flutter/material.dart';

class TelaReceitas extends StatelessWidget {
  const TelaReceitas({super.key});

  final List<Map<String, String>> receitas = const [
    {
      "nome": "Arroz com legumes",
      "descricao":
          "Reaproveita arroz cozido, cenoura e sobras de legumes da cozinha."
    },
    {
      "nome": "Sopa nutritiva",
      "descricao":
          "Ideal para utilizar verduras próximas do vencimento e reduzir desperdício."
    },
    {
      "nome": "Omelete escolar",
      "descricao":
          "Usa ovos e pequenas sobras de vegetais do estoque."
    },
    {
      "nome": "Bolo de banana madura",
      "descricao":
          "Aproveita bananas maduras que seriam descartadas."
    },
    {
      "nome": "Salada criativa",
      "descricao":
          "Combina hortifruti disponível no estoque da escola."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6D1BA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF6D1BA),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(0xFFC46000),
        ),
        title: const Text(
          "Receitas",
          style: TextStyle(
            color: Color(0xFFC46000),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const Text(
                "Sugestões para reaproveitamento de alimentos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFC46000),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: receitas.length,
                itemBuilder: (context, index) {
                  final receita = receitas[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),

                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF7900).withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.restaurant_menu,
                          color: Color(0xFFFF7900),
                        ),
                      ),

                      title: Text(
                        receita["nome"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xFFC46000),
                        ),
                      ),

                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          receita["descricao"]!,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            height: 1.3,
                          ),
                        ),
                      ),

                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xFFFF7900),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}