import 'package:flutter/material.dart';
import '../../database/database_helper.dart';
import 'tela_entrada.dart';

class TelaEstoque extends StatefulWidget {
  const TelaEstoque({super.key});

  @override
  State<TelaEstoque> createState() => _TelaEstoqueState();
}

class _TelaEstoqueState extends State<TelaEstoque> {
  List<Map<String, dynamic>> estoque = [];

  @override
  void initState() {
    super.initState();
    carregarEstoque();
  }

  Future<void> carregarEstoque() async {
    final dados = await DatabaseHelper.instance.listarEstoque();
    setState(() => estoque = dados);
  }

  Future<void> abrirEntrada() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TelaEntrada()),
    );
    carregarEstoque();
  }

  Future<void> deletar(int id) async {
    await DatabaseHelper.instance.deletarItemEstoque(id);
    carregarEstoque();
  }

  Future<void> editar(Map<String, dynamic> item) async {
  final nomeController = TextEditingController(text: item['nome']);
  final qtdController = TextEditingController(text: item['quantidade']);

  String unidadeSelecionada = item['tipo'] ?? "kg";

  final unidades = ["kg", "L", "unidades"];

  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            backgroundColor: const Color(0xFFF5F5F5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text(
              "Editar item",
              style: TextStyle(
                color: Color(0xFFC46000),
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: const TextStyle(color: Color(0xFFC46000)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFFF7900),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFC46000),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: qtdController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Quantidade",
                    labelStyle: const TextStyle(color: Color(0xFFC46000)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFFF7900),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFC46000),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFC46000)),
                    borderRadius: BorderRadius.circular(12),
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
                      setStateDialog(() {
                        unidadeSelecionada = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7900),
                ),
                onPressed: () async {
                  await DatabaseHelper.instance.atualizarItemEstoque({
                    'id': item['id'],
                    'nome': nomeController.text,
                    'quantidade': qtdController.text,
                    'tipo': unidadeSelecionada,
                    'validade': item['validade'],
                  });

                  Navigator.pop(context);
                  carregarEstoque();
                },
                child: const Text(
                  "Salvar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

  // 🔥 RISCO (você já tinha isso)
  Color getCorRisco(Map item) {
    final qtd = int.tryParse(
      item['quantidade'].toString().replaceAll(RegExp(r'[^0-9]'), ''),
    ) ?? 0;

    if (qtd > 50) return Colors.red;
    if (qtd > 20) return Colors.orange;
    return Colors.green;
  }

  String getTextoRisco(Map item) {
    final qtd = int.tryParse(
      item['quantidade'].toString().replaceAll(RegExp(r'[^0-9]'), ''),
    ) ?? 0;

    if (qtd > 50) return "Alto risco de desperdício";
    if (qtd > 20) return "Atenção: possível desperdício";
    return "Baixo risco";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6D1BA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF6D1BA),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFFC46000)),
        title: const Text(
          "Estoque",
          style: TextStyle(
            color: Color(0xFFC46000),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF7900),
        onPressed: abrirEntrada,
        child: const Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              child: Text("${estoque.length} itens cadastrados"),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: estoque.length,
                itemBuilder: (context, index) {
                  final item = estoque[index];
                  final cor = getCorRisco(item);

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: cor.withOpacity(0.12), // 🔥 RISCO AQUI
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.inventory_2_outlined,
                        color: cor, // 🔥 ÍCONE COLORIDO
                      ),

                      title: Text(item["nome"] ?? ""),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
  "Quantidade: ${item["quantidade"]} ${item["tipo"] ?? ""}",
  style: const TextStyle(
    color: Colors.black87,
    fontSize: 13,
  ),
),

                          const SizedBox(height: 4),

                          Text(
                            getTextoRisco(item), // 🔥 TEXTO DE DESPERDÍCIO
                            style: TextStyle(
                              color: cor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () => editar(item),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deletar(item['id']),
                          ),
                        ],
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