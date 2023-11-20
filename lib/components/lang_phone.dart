import 'package:flutter/material.dart';

class LanguageNPhone extends StatefulWidget {
  const LanguageNPhone({super.key});

  @override
  State<LanguageNPhone> createState() => _LanguageNPhoneState();
}

class _LanguageNPhoneState extends State<LanguageNPhone> {
  List languagesList = ["English US", "English UK", "Hindi", "Bengali"];
  List countryCodesList = ["India", "Pakistan", "USA"];
  String defaultLanguage = "English US";
  String defaultCode = "India";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          const SizedBox(
              width: 400,
              child: Text(
                'Language:',
                style: TextStyle(fontWeight: FontWeight.w700),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gmail Display Language:',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              InkWell(
                  onTap: () {},
                  child: const Text(
                    'Show all language options',
                    style: TextStyle(color: Colors.purple),
                  ))
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: DropdownButton<String>(
                value: defaultLanguage,
                focusColor: Colors.transparent,
                onChanged: (value) {
                  setState(() {
                    defaultLanguage = value!;
                  });
                },
                items: languagesList
                    .map(
                      (e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ),
                    )
                    .toList(),
              )),
          InkWell(
            child: const Text(
              'Change Language settings for other Google Products',
              style: TextStyle(color: Colors.purple),
            ),
            onTap: () {},
          ),
        ],
      ),
      const Divider(),
      Row(
        children: [
          const SizedBox(
              width: 400,
              child: Text(
                'Phone Numbers:',
                style: TextStyle(fontWeight: FontWeight.w700),
              )),
          const Text(
            'Default Country Code:',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: DropdownButton<String>(
              value: defaultCode,
              focusColor: Colors.transparent,
              onChanged: (value) {
                setState(() {
                  defaultCode = value!;
                });
              },
              items: countryCodesList
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    ]);
  }
}
