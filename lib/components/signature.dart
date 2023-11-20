import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class Signature extends StatefulWidget {
  const Signature({super.key});

  @override
  State<Signature> createState() => _SignatureState();
}

class Sign {
  String name;
  String? json;
  Sign({required this.name, this.json});
}

class _SignatureState extends State<Signature> {
  late QuillController _signTextFieldController;
  late TextEditingController _newSignTextController;
  int selectedIndex = 0;
  late List<Sign> signatureList = [
    Sign(
      name: "Default",
    ),
    Sign(name: "Signature 1"),
  ];
  bool checkboxValue = false;
  String newMailSign = "Default";
  String replyMailSign = "Default";

  @override
  void initState() {
    super.initState();
    _newSignTextController = TextEditingController();
    _signTextFieldController = QuillController.basic();
  }

  @override
  void dispose() {
    super.dispose();
    _signTextFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Signature:',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const Text("(appended at the end of all outgoing messages)"),
              InkWell(
                child: const Text(
                  'Learn More',
                  style: TextStyle(color: Colors.purple),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    // borderRadius: BorderRadius.circular(0),
                  ),
                  child: ListView.builder(
                    itemCount: signatureList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(signatureList[index].name),
                        selected: index == selectedIndex,
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            // _signTextFieldController.document =
                            //     Document.fromJson(
                            //         jsonDecode(signatureList[index].json!));
                          });
                        },
                      );
                    },
                  ),
                ),
                Container(
                  height: 200,
                  width: 600,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    // borderRadius: BorderRadius.circular(5),
                  ),
                  child: QuillProvider(
                    configurations: QuillConfigurations(
                      controller: _signTextFieldController,
                      sharedConfigurations: const QuillSharedConfigurations(
                        locale: Locale('en'),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: QuillEditor.basic(
                              configurations: const QuillEditorConfigurations(
                                readOnly: false,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        const QuillToolbar(),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Name new Signature"),
                      content: TextField(controller: _newSignTextController),
                      actions: [
                        TextButton(
                            onPressed: () =>
                                Navigator.of(context, rootNavigator: true)
                                    .pop(),
                            child: Text("Cancel")),
                        FilledButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              setState(() {
                                _signTextFieldController.clear();
                                signatureList.add(Sign(
                                    name: _newSignTextController.text,
                                    json: jsonEncode(_signTextFieldController
                                        .document
                                        .toDelta()
                                        .toJson())));
                              });
                            },
                            child: Text("Create"))
                      ],
                    );
                  },
                );
              },
              child: const Text("Add new Signature"),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Signature Defaults',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "FOR NEW EMAILS USE",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    DropdownButton(
                      onChanged: (value) {
                        setState(() {
                          newMailSign = value!;
                        });
                      },
                      focusColor: Colors.transparent,
                      value: newMailSign,
                      items: signatureList
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e.name,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
                const SizedBox(
                  width: 32,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ON REPLY/FORWARD USE",
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])),
                    DropdownButton(
                      onChanged: (value) {
                        setState(() {
                          replyMailSign = value!;
                        });
                      },
                      focusColor: Colors.transparent,
                      value: replyMailSign,
                      items: signatureList
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e.name,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: checkboxValue,
                  onChanged: (value) {
                    setState(() {
                      checkboxValue = value!;
                    });
                  },
                ),
                const Text(
                    "Insert signature before quoted text in replies and remove the \"--\" line that precedes it.")
              ],
            )
          ],
        ),
      ],
    );
  }
}
