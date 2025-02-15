import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:monalyse_ui_test/app/constants/app_colors.dart';
import 'package:monalyse_ui_test/app/extensions/context_extensions.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_event.dart';
import 'package:monalyse_ui_test/presentation/features/home/widgets/card_widget.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/language_bloc/language_bloc.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/language_bloc/language_bloc_event.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/language_bloc/language_bloc_state.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/theme_cubit/theme_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = "";
  DateTime? _fromDate;
  DateTime? _toDate;
  List<Map<String, String>> articles = [];
  final Random random = Random();
  bool _initialized = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _loadArticles();
      _initialized = true;
    } else {
      _updateArticleTexts();
    }
  }

  void _loadArticles() {
    articles = List.generate(281, (index) {
      Random random = Random();
      int year = 2022 + random.nextInt(4);
      int month = 1 + random.nextInt(12);
      int day = 1 + random.nextInt(28);
      String date =
          "$day-$month-$year 13:${random.nextInt(60).toString().padLeft(2, '0')}";

      return {
        "id": index.toString(),
        "title": '',
        "source": '',
        "date": date,
        "content": ''
      };
    });

    _updateArticleTexts();
  }

  void _updateArticleTexts() {
    setState(() {
      articles = articles.map((article) {
        int index = int.parse(article["id"]!);
        return {
          "id": article["id"]!,
          "title": context.localizations.title_card_text(index),
          "source": context.localizations.source_card_text(index),
          "date": article["date"]!, // Mantiene la misma fecha
          "content": (index % 4 == 0)
              ? context.localizations.content_card_netflix_text
              : (index % 4 == 1)
                  ? context.localizations.content_card_gen_text
                  : (index % 4 == 2)
                      ? context.localizations.content_card_hbo_text
                      : context.localizations.content_card_disney_text,
        };
      }).toList();
    });
  }

  void _logOut(BuildContext context) {
    Navigator.pop(context); // state.userAuthStatus.isLoggedIn()

    context.read<AuthBloc>().add(const AuthEvent.signOutEvent());
  }

  void _changeLanguage(Locale? value, BuildContext context) {
    context.read<LanguagesBloc>().add(
          LanguageBlocEvent.changedLanguage(
            value ?? const Locale.fromSubtags(languageCode: 'es'),
          ),
        );
  }

  void _openSettings(BuildContext context, bool isDarkMode) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabBar(
                  tabs: [
                    Tab(
                        icon: Icon(
                          Icons.logout,
                        ),
                        text: context.localizations.log_out_text),
                    Tab(
                        icon: Icon(
                          Icons.language,
                        ),
                        text: context.localizations.language_text),
                    Tab(
                        icon: Icon(
                          context.read<ThemeCubit>().state == ThemeMode.dark
                              ? Icons.dark_mode
                              : Icons.light_mode,
                        ),
                        text: 'Cambia el tema'),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: TabBarView(
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () => _logOut(context),
                          child: Text(context.localizations.log_out_text),
                        ),
                      ),
                      Center(
                        child: DropdownButton<Locale>(
                          value: context.read<LanguagesBloc>().state.locale,
                          onChanged: (newValue) {
                            _changeLanguage(newValue, context);
                          },
                          items: [
                            DropdownMenuItem(
                              value: const Locale('es', 'ES'),
                              child: Text(
                                  context.localizations.spanish_language_text),
                            ),
                            DropdownMenuItem(
                              value: const Locale('en', 'US'),
                              child: Text(
                                  context.localizations.english_language_text),
                            ),
                            DropdownMenuItem(
                              value: const Locale('nl', 'NL'),
                              child: Text(
                                  context.localizations.dutch_language_text),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () =>
                              context.read<ThemeCubit>().toggleTheme(),
                          child: Text('Cambiar tema'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Map<String, String>> get _filteredArticles {
    return articles.where((article) {
      final bool matchesSearch = _searchQuery.isEmpty ||
          article["content"]!
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());
      final bool matchesDate = (_fromDate == null ||
              DateFormat("dd-MM-yyyy HH:mm")
                  .parse(article["date"]!)
                  .isAfter(_fromDate!)) &&
          (_toDate == null ||
              DateFormat("dd-MM-yyyy HH:mm")
                  .parse(article["date"]!)
                  .isBefore(_toDate!));
      return matchesSearch && matchesDate;
    }).toList();
  }

  void _applyFilter() {
    setState(() {});
  }

  void _resetFilter() {
    setState(() {
      _searchQuery = "";

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
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }

    return null;
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
                  Text(context.localizations.filter_text,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: context.localizations.search_text),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
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
                            ? context.localizations.from_text
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
                            ? context.localizations.to_text
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
                        child: Text(context.localizations.apply_filter_text),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _resetFilter();
                          Navigator.pop(context);
                        },
                        child: Text(context.localizations.reset_text),
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

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<LanguagesBloc, LanguageBlocState>(
        listener: (context, state) {
          _loadArticles();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          appBar: AppBar(
            backgroundColor:
                isDarkMode ? Colors.grey[900] : AppColors.loginBackground,
            title: Text(
              context.localizations.title_home_text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.grey[400] : AppColors.loginText,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Image.asset('assets/logos/monalyse_logo_2.jpeg', height: 50),
            ),
            actions: [
              IconButton(
                color: isDarkMode ? Colors.grey[400] : Colors.white,
                icon: const Icon(Icons.settings),
                onPressed: () => _openSettings(context, isDarkMode),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    context.localizations.showing_articles_text(
                        _filteredArticles.length, articles.length),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? Colors.white : Colors.grey.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _filteredArticles.length,
                    itemBuilder: (context, index) {
                      return articleCard(
                          context, _filteredArticles[index], isDarkMode);
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Stack(
            children: [
              Positioned(
                left: screenWidth * 0.1,
                bottom: 20,
                child: FloatingActionButton(
                  onPressed: () => _showFilterModal(context),
                  backgroundColor:
                      isDarkMode ? Colors.grey[800] : AppColors.loginBackground,
                  child: Icon(Icons.filter_list, color: Colors.white),
                ),
              ),
              Positioned(
                right: screenWidth * 0.04,
                bottom: 20,
                child: FloatingActionButton(
                  onPressed: _scrollToTop,
                  backgroundColor:
                      isDarkMode ? Colors.grey[800] : AppColors.loginBackground,
                  child: Icon(Icons.arrow_upward, color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
