import 'package:flutter/material.dart';
import 'package:gmail/components/def_text_style.dart';
import 'package:gmail/components/lang_phone.dart';
import 'package:gmail/components/signature.dart';
import 'package:gmail/components/stars.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            LanguageNPhone(),
            Divider(),
            DefTextStyle(),
            Divider(),
            Stars(),
            Divider(),
            Signature()
          ],
        ),
      ),
    ));
  }
}
