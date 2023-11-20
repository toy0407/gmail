import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DefTextStyle extends StatefulWidget {
  const DefTextStyle({super.key});

  @override
  State<DefTextStyle> createState() => _DefTextStyleState();
}

class Size {
  String name;
  double val;
  Size({required this.name, required this.val});
}

class _DefTextStyleState extends State<DefTextStyle> {
  var fontType = "Nunito Sans";
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);
  double fontSize = 18;
  List<Size> sizeList = [
    Size(name: "Small", val: 12),
    Size(name: "Normal", val: 18),
    Size(name: "Large", val: 24),
    Size(name: "Huge", val: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Default Text Style:',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(
                  '(Use the \'Remove formatting\' button on the toolbar to reset the default text style)')
            ],
          ),
        ),
        Card(
          elevation: 2,
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownMenu(
                      hintText: "Font",
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(
                          value: 0,
                          label: "Nunito Sans",
                        ),
                        DropdownMenuEntry(
                          value: 1,
                          label: "Raleway",
                        ),
                      ],
                      onSelected: (value) {
                        setState(() {
                          if (value == 0) {
                            fontType = "Nunito Sans";
                          } else if (value == 1) {
                            fontType = "Raleway";
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),

                    DropdownMenu(
                      hintText: "Size",
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 0, label: "Small"),
                        DropdownMenuEntry(value: 1, label: "Normal"),
                        DropdownMenuEntry(value: 2, label: "Large"),
                        DropdownMenuEntry(value: 3, label: "Huge"),
                      ],
                      onSelected: (value) {
                        setState(() {
                          fontSize = sizeList[value!].val;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ), //TODO
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                child: AlertDialog(
                                  title: const Text("Pick Color"),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: pickerColor,
                                      onColorChanged: (value) {
                                        setState(() {
                                          pickerColor = value;
                                        });
                                      },
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          currentColor = pickerColor;
                                        });
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      child: const Text("Done"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.text_format))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'This is what your body text will look like.',
                  style: TextStyle(
                      color: currentColor,
                      fontSize: fontSize,
                      fontFamily: fontType),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
