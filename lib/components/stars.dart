import 'package:flutter/material.dart';

class Stars extends StatefulWidget {
  const Stars({super.key});

  @override
  State<Stars> createState() => _StarsState();
}

class _StarsState extends State<Stars> {
  // List<Draggable> iconList1 = [
  //   Draggable(
  //     child: Icon(Icons.star),
  //     feedback: Icon(Icons.star),
  //   ),
  //   Draggable(
  //     child: Icon(Icons.star_border),
  //     feedback: Icon(Icons.star),
  //   ),
  //   Draggable(
  //     child: Icon(Icons.star_border_purple500),
  //     feedback: Icon(Icons.star),
  //   )
  // ];
  List<Icon> iconList1 = [
    Icon(Icons.star),
    Icon(Icons.star_border),
    Icon(Icons.star_border_purple500)
  ];
  List<Icon> iconList2 = [
    Icon(Icons.star),
    Icon(Icons.star_border),
    Icon(Icons.star_border_purple500)
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 400,
          child: Text(
            'Stars:',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                  text: "Drag the stars between the lists.",
                  style: TextStyle(fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                        text:
                            ' The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.',
                        style: TextStyle(fontWeight: FontWeight.normal))
                  ]),
            ),
            // In Use List

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("In Use: "),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 20,
                  width: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: iconList1.length,
                    itemBuilder: (context, index) {
                      return iconList1[index];
                    },
                  ),
                ),
                // DragTarget(
                //   builder: (context, candidateData, rejectedData) {},
                // )
              ],
            ),
            // Not In Use List
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Not in Use: "),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 20,
                  width: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: iconList2.length,
                    itemBuilder: (context, index) {
                      return iconList2[index];
                    },
                  ),
                ),
                // DragTarget(
                //   builder: (context, candidateData, rejectedData) {},
                // )
              ],
            )
          ],
        )
      ],
    );
  }
}
