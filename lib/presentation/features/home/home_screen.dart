import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monalyse_ui_test/app/config/app_fonts.dart';
import 'package:monalyse_ui_test/app/extensions/context_extensions.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_event.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/language_bloc/language_bloc.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/language_bloc/language_bloc_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF404A66), // Azul oscuro
        title: const Text("1. Mediamonitoring Netf"),
        actions: [
          IconButton(
            color: const Color.fromARGB(255, 255, 255, 255),
            icon: const Icon(Icons.logout),
            onPressed: () {
              _logOut(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Botones superiores
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _customButton("FILTERS"),
                _customButton("SEARCH"),
                _customButton("RESET"),
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
                    color: Colors.black.withOpacity(0.1),
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
              child: ListView(
                children: [
                  _articleCard("📱 De iPad/tablet, waarvoor gebruik jij hem?",
                      "MacFreak", "04-02-2025 13:09"),
                  _articleCard(
                      "📱 Heftige WOII-serie 'De Zaak Menten' gaat Netflix verlaten: 'Dat zulke monsters gewoon over straat lopen'",
                      "MovieMeter",
                      "04-02-2025 13:09"),
                  _articleCard(
                      "📱 Prijswinnende docu over moedige klimmer nu te zien op Netflix",
                      "Filmandag",
                      "04-02-2025 13:06"),
                ],
              ),
            ),
            // Pie de página
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Showing 60 of 295 articles",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para los botones superiores
  Widget _customButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF404A66), // Azul oscuro
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  // Widget para las tarjetas de artículos
  Widget _articleCard(String title, String source, String date) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text("$source · $date",
                style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF404A66), // Azul oscuro
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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

/*

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.home_screen_title),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localizations.welcome_text,
              style: AppFonts.bodyMd,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<Locale>(
                value: context.read<LanguagesBloc>().state.locale,
                onChanged: (value) => _changeLanguage(value, context),
                items: [
                  DropdownMenuItem(
                    value: const Locale('es', 'ES'),
                    child: Text(context.localizations.spanish_language_text),
                  ),
                  DropdownMenuItem(
                    value: const Locale('en', 'US'),
                    child: Text(context.localizations.english_language_text),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _logOut(context),
              child: Text(context.localizations.log_out_text),
            ),
          ],
        ),
      ),
    );
  }

  */

void _logOut(BuildContext context) =>
    context.read<AuthBloc>().add(const AuthEvent.signOutEvent());

void _changeLanguage(Locale? value, BuildContext context) {
  context.read<LanguagesBloc>().add(
        LanguageBlocEvent.changedLanguage(
          value ?? const Locale.fromSubtags(languageCode: 'es'),
        ),
      );
}
