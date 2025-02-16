# Monalyse

**Monalyse** is a media monitoring application that allows users to search, filter, and view articles about streaming and sports trends. The app supports multiple languages, allows switching between light and dark themes, and offers an optimized user experience with floating buttons and advanced filters.

## 📌 Features

- 🔍 **Search and filter articles** by keywords and dates.
- 🌍 **Multilingual support** (Spanish, English, Dutch).
- 🌙 **Customizable dark and light mode**.
- 🎛️ **Settings modal** with language switching, dark mode, and logout.
- 📜 **Dynamically generated article list** which depends on dropdown selector.
- 🔄 **Scroll-to-top button** to quickly return to the top of the list.
- 🛠 **BLoC-based architecture** for state management.

## 🚀 Installation and Execution

1. Clone this repository:

   ```sh
   git clone https://github.com/sperezvaldericeda/monalyse_ui_test.git
   3.	cd monalyse_ui_test
4.	Install dependencies:
5.	flutter pub get
6.	Run the application:
7.	flutter run
🛠 Technologies Used
•	Flutter (Dart) - Development framework
•	Flutter BLoC - State management
•	GoRouter - Route handling
•	Intl - Internationalization
•	SharedPreferences - Data persistence
•	Dio - HTTP client
•	Freezed & JSON Serializable - Data modeling

##  🎨 Theme Customization
The dark and light mode is managed using ThemeCubit. Users can switch between them with:
context.read<ThemeCubit>().toggleTheme();
The themeMode is set in main.dart:
themeMode: themeMode, // Dynamic theme based on user preference


##  🌍 Language Configuration

The app uses flutter_localizations and intl for language management. Language switching is dynamically handled by:
context.read<LanguagesBloc>().add(LanguageBlocEvent.changedLanguage(locale));
Translated texts are stored in .arb files inside lib/l10n/.

⚡ Key Functionalities
•	Home Screen (HomeScreen)
   •	Dynamic article list
   •	Search and filtering with showModalBottomSheet
   •	Settings button for language, theme, and logout
•	Authentication Screen (AuthenticationScreen)
   •	Login with AuthBloc
   •	User state persistence
•	Navigation (GoRouter)
   •	Routes are managed in app/routes/app_routes.dart


##  👤 Author
•	Silvia Pérez Valdericeda - Development and Design




