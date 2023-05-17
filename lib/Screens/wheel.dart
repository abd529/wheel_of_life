// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class WheelOfLife extends StatelessWidget {
  final adjustData;
  const WheelOfLife({super.key, this.adjustData});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
        child: 
        Padding(
              padding: const EdgeInsets.all(05),
              child: Column(
                children: [
                  const Text("Your Wheel of life", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: size.width-30,
                      height: 300,
                      child:
                       Chart(
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
                  const Text("Do you want us to email the result to you for only \$1.99", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 10),
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                              shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(50)
                     ) ),
                    onPressed: (){}, child: const Text("Get email for \$1.99")),
                  const SizedBox(height: 30),
                  const Text("Get email and get contacted with certified coach", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 10),
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                              shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(50)
                     ) ),
                    onPressed: (){}, child: const Text("Get email & Coach for \$2.99")),
                  const SizedBox(height: 30),
                  const Text("Send me and my coach an email for free", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 10),
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                              shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(50)
                     ) ),
                    onPressed: (){}, child: const Text("Send email to me and my coach ")),  
                ],
              ),
            ),
        ),
      ),
    );
  }
}