import 'package:flutter/material.dart';

class ChartBarWidget extends StatelessWidget {
  final String label;
  final double value;
  final double percent;

  const ChartBarWidget({
    Key? key,
    required this.label,
    required this.value,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 18,
          width: 40,
          child: FittedBox(child: Text(value.toStringAsFixed(2))),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: 10,
          height: 60,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                height: 60 * percent,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        Text(label),
      ],
    );
  }
}
