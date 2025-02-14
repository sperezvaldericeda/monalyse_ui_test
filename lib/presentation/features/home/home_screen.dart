import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:monalyse_ui_test/app/constants/app_colors.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_event.dart';
import 'package:monalyse_ui_test/presentation/features/home/widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _filter = "";

  DateTime? _fromDate;
  DateTime? _toDate;

  final List<Map<String, String>> _articles = List.generate(25, (index) {
    return {
      "title": "Artículo $index: Nueva tendencia en streaming",
      "source": "Fuente $index",
      "date": "04-02-2025 13:0$index",
      "content": (index % 4 == 0)
          ? "Netflix anuncia nueva serie exclusiva."
          : (index % 4 == 1)
              ? "Otras noticias sobre streaming."
              : (index % 4 == 2)
                  ? "Novedad en HBO, nueva película disponible."
                  : "Disney estrena contenido exclusivo en su plataforma."
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

      _fromDate = null;
      _toDate = null;
    });
  }

  Future<DateTime?> _selectDate(BuildContext context, bool isFrom) async {
    DateTime initialDate =
        isFrom ? _fromDate ?? DateTime.now() : _toDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    return picked;
  }

  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext modalContext) {
        // Aquí usamos modalContext
        return StatefulBuilder(
          builder: (modalContext, setModalState) {
            // Se usa setModalState
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 16.0,
                  right: 16.0,
                  top: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: "Search"),
                    onChanged: (value) {
                      setModalState(() {
                        _filter = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          DateTime? picked = await _selectDate(context, true);
                          if (picked != null) {
                            setModalState(() {
                              _fromDate = picked;
                            });
                          }
                        },
                        child: Text(_fromDate == null
                            ? "Desde"
                            : DateFormat("dd/MM/yyyy").format(_fromDate!)),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          DateTime? picked = await _selectDate(context, false);
                          if (picked != null) {
                            setModalState(() {
                              _toDate = picked;
                            });
                          }
                        },
                        child: Text(_toDate == null
                            ? "Hasta"
                            : DateFormat("dd/MM/yyyy").format(_toDate!)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
        backgroundColor: AppColors.loginBackground,
        title: const Text(
          "Mediamonitoring Netf",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.loginText),
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
            ElevatedButton(
              onPressed: () => _showFilterModal(context),
              child: const Text("Filtros"),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredArticles.length,
                itemBuilder: (context, index) {
                  return articleCard(context, _filteredArticles[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Mostrando ${_filteredArticles.length} de ${_articles.length} artículos",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
