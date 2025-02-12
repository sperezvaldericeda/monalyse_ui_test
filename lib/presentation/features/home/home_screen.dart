import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _filter = "";
  String _selectedArticleType = "All";
  DateTime? _fromDate;
  DateTime? _toDate;

  final List<Map<String, String>> _articles = List.generate(25, (index) {
    return {
      "title": "Artículo $index: Nueva tendencia en streaming",
      "source": "Fuente $index",
      "date": "04-02-2025 13:0$index",
      "content": index % 3 == 0
          ? "Netflix anuncia nueva serie exclusiva."
          : "Otras noticias sobre streaming."
    };
  });

  List<Map<String, String>> get _filteredArticles {
    return _articles.where((article) {
      final bool matchesFilter = _filter.isEmpty ||
          article["content"]!.toLowerCase().contains(_filter);
      final bool matchesDate = (_fromDate == null ||
              DateFormat("dd-MM-yyyy HH:mm")
                  .parse(article["date"]!)
                  .isAfter(_fromDate!)) &&
          (_toDate == null ||
              DateFormat("dd-MM-yyyy HH:mm")
                  .parse(article["date"]!)
                  .isBefore(_toDate!));
      return matchesFilter && matchesDate;
    }).toList();
  }

  void _applyFilter() {
    setState(() {});
  }

  void _resetFilter() {
    setState(() {
      _filter = "";
      _selectedArticleType = "All";
      _fromDate = null;
      _toDate = null;
    });
  }

  Future<void> _selectDate(BuildContext context, bool isFrom) async {
    DateTime initialDate =
        isFrom ? _fromDate ?? DateTime.now() : _toDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: _selectedArticleType,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedArticleType = newValue!;
                  });
                },
                items: ["All", "News", "Reviews", "Interviews"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Search"),
                onChanged: (value) {
                  _filter = value.toLowerCase();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("From"),
                      TextButton(
                        onPressed: () => _selectDate(context, true),
                        child: Text(_fromDate == null
                            ? "Select Date"
                            : DateFormat("dd/MM/yyyy").format(_fromDate!)),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("To"),
                      TextButton(
                        onPressed: () => _selectDate(context, false),
                        child: Text(_toDate == null
                            ? "Select Date"
                            : DateFormat("dd/MM/yyyy").format(_toDate!)),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _applyFilter();
                      Navigator.pop(context);
                    },
                    child: const Text("Apply Filters"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _resetFilter();
                      Navigator.pop(context);
                    },
                    child: const Text("Reset"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _logOut(BuildContext context) =>
      context.read<AuthBloc>().add(const AuthEvent.signOutEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF404A66),
        title: const Text(
          "Mediamonitoring Netf",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logos/monalyse_logo_2.jpeg', height: 50),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.logout),
            onPressed: () => _logOut(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Filtros
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _showFilterModal(context),
                  child: const Text("FILTER"),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Nube de palabras (simulación con un Container)
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(
                        (0.1 * 255).toInt(), 0, 0, 0), // Using withValues
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: const Text(
                  "Netflix  KPN  Klanten  Seizoen  Streamingdienst",
                  style: TextStyle(fontSize: 16, color: Colors.brown),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Lista de artículos
            Expanded(
              child: ListView.builder(
                itemCount: _filteredArticles.length,
                itemBuilder: (context, index) {
                  return _articleCard(_filteredArticles[index]);
                },
              ),
            ),
            // Pie de página
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Showing ${_filteredArticles.length} of ${_articles.length} articles",
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _articleCard(Map<String, String> article) {
    final bool hasNetflix =
        article["content"]!.toLowerCase().contains("netflix");
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article["title"]!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text("${article["source"]} · ${article["date"]}",
                style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            if (hasNetflix) // Agregar imagen si es sobre Netflix
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  'assets/images/descarga.jpeg',
                  height: 50,
                ),
              ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF404A66),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("SHARE LINK",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
