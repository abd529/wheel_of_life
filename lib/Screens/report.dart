// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:wheel_of_life/Authentication/signup_screen.dart';
import 'package:numberpicker/numberpicker.dart';
import '../Utilities/data.dart';

class DetailPage extends StatefulWidget {
  static const routeName = "report-page";
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _currentValue = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PdfPreviewPage(),
            ),
          );
          // rootBundle.
        },
        child: const Icon(Icons.picture_as_pdf),
      ),
      appBar: AppBar(
        title: const Text("Report # 529"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: adjustData,
                  variables: {
                    'index': Variable(
                      accessor: (Map map) => map['index'].toString(),
                    ),
                    'type': Variable(
                      accessor: (Map map) => map['type'] as String,
                    ),
                    'value': Variable(
                      accessor: (Map map) => map['value'] as num,
                    ),
                  },
                  marks: [
                    LineMark(
                      position:
                          Varset('index') * Varset('value') / Varset('type'),
                      shape: ShapeEncode(value: BasicLineShape(loop: true)),
                      color: ColorEncode(
                          variable: 'type', values: Defaults.colors10),
                    )
                  ],
                  coord: PolarCoord(),
                  axes: [
                    Defaults.circularAxis,
                    Defaults.radialAxis,
                  ],
                  selections: {
                    'touchMove': PointSelection(
                      on: {
                        GestureType.scaleUpdate,
                        GestureType.tapDown,
                        GestureType.longPressMoveUpdate
                      },
                      dim: Dim.x,
                      variable: 'index',
                    )
                  },
                  tooltip: TooltipGuide(
                    anchor: (_) => Offset.zero,
                    align: Alignment.bottomRight,
                    multiTuples: true,
                    variables: ['type', 'value'],
                  ),
                  crosshair: CrosshairGuide(followPointer: [false, true]),
                ),
              ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Column(
                children: [
                  const Text(
                    'Invoice Items',
                  ),
                  DefaultTextStyle.merge(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:const [
                         Text("Total"),
                         Text(
                          "\$529.29",
                        ),
                      ],
                    ),
                    
                  ),
                  ElevatedButton(onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => SignupScreen(),
                                  ),
                                  (Route<dynamic> route) => false);
                            }, child: Text("Log out"))
                ],
              ),
            ),
          ),
          NumberPicker(
          value:_currentValue,
          minValue: 0,
          maxValue: 10,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Text('Current value: $_currentValue'),
        ],
      ),
    );
  }
}

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
    );
  }
}