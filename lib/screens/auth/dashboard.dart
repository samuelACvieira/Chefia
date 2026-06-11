import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const _DashboardHome(),
    const _PlaceholderPage(titulo: "Estoque"),
    const _PlaceholderPage(titulo: "Relatórios"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDCFA1),

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFB55400),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: "Estoque",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Relatórios",
          ),
        ],
      ),
    );
  }
}

// =====================
// 👇 SEU DASHBOARD ORIGINAL (SEM MUDAR NADA)
// =====================

class _DashboardHome extends StatelessWidget {
  const _DashboardHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDCFA1),

      appBar: AppBar(
        backgroundColor: const Color(0xFFB55400),
        elevation: 0,
        title: const Text(
          "ChefIA",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Olá, Escola 👋",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB55400),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Gerencie sua alimentação escolar com inteligência.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                Expanded(child: _buildCard("Estoque", "156 itens", Icons.inventory_2)),
                const SizedBox(width: 12),
                Expanded(child: _buildCard("Alunos", "480", Icons.school)),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _buildCard("Economia", "32 kg", Icons.recycling)),
                const SizedBox(width: 12),
                Expanded(child: _buildCard("Alertas", "5", Icons.warning_amber_rounded)),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Ações rápidas",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB55400),
              ),
            ),

            const SizedBox(height: 15),

            _actionButton(icon: Icons.add_box, title: "Registrar Entrada", onTap: () {}),
            const SizedBox(height: 12),
            _actionButton(icon: Icons.restaurant, title: "Registrar Consumo", onTap: () {}),
            const SizedBox(height: 12),
            _actionButton(icon: Icons.inventory, title: "Ver Estoque", onTap: () {}),
            const SizedBox(height: 12),
            _actionButton(icon: Icons.smart_toy, title: "Sugestão ChefIA", onTap: () {}),

            const SizedBox(height: 30),

            const Text(
              "Alertas recentes",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB55400),
              ),
            ),

            const SizedBox(height: 15),

            _alertCard("Leite vence amanhã", Icons.warning),
            const SizedBox(height: 10),
            _alertCard("Bananas vencem em 2 dias", Icons.warning),
            const SizedBox(height: 10),
            _alertCard("Estoque de arroz abaixo do ideal", Icons.inventory),
          ],
        ),
      ),
    );
  }

  static Widget _buildCard(String titulo, String valor, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFFBE2C4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFB55400), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFFB55400), size: 30),
          const SizedBox(height: 8),
          Text(valor,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB55400))),
          Text(titulo,
              style: const TextStyle(color: Color(0xFFB55400))),
        ],
      ),
    );
  }

  static Widget _actionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB55400),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  static Widget _alertCard(String texto, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFFBE2C4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          const SizedBox(width: 10),
          Expanded(child: Text(texto)),
        ],
      ),
    );
  }
}

// =====================
// 👇 TABS DA BOTTOM BAR
// =====================

class _PlaceholderPage extends StatelessWidget {
  final String titulo;

  const _PlaceholderPage({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        titulo,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFFB55400),
        ),
      ),
    );
  }
}