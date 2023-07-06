import 'package:flutter/material.dart';

class DayButton extends StatefulWidget {
  const DayButton({super.key, required this.dt});

  final DateTime dt;

  @override
  State<DayButton> createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  int _timesBrushed = 0;
  int _maxTimesToBrushForDay = 2;

  Map<int, Color> _timesBrushedCorrespondingColor = {
    0: const Color.fromARGB(255, 228, 226, 226),
    1: Colors.yellow,
    2: Colors.green
  };

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            minimumSize: Size(50, 80),
            backgroundColor: _timesBrushedCorrespondingColor[_timesBrushed]),
        onPressed: () => {
              setState(() => {_timesBrushed++})
            },
        child: Text(widget.dt.day.toString()));
  }
}

class DayWidget extends StatefulWidget {
  const DayWidget({super.key});

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
