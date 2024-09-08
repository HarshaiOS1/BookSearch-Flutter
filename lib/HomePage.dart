import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const HomePage({super.key, required this.onLocaleChange});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Locale _selectedLocale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.searchBook,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          DropdownButton<Locale>(
            value: _selectedLocale,
            icon: const Icon(Icons.language, color: Colors.black),
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                setState(() {
                  _selectedLocale = newLocale;
                });
                widget.onLocaleChange(newLocale);
              }
            },
            items: AppLocalizations.supportedLocales.map<DropdownMenuItem<Locale>>((Locale locale) {
              return DropdownMenuItem<Locale>(
                value: locale,
                child: Text(locale.languageCode.toUpperCase()),
              );
            }).toList(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}