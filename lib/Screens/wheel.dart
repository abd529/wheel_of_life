import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class WheelOfLife extends StatelessWidget {
  final adjustData;
  const WheelOfLife({super.key, this.adjustData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
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
          ),
      ),
    );
  }
}