import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class DayButton extends StatefulWidget {
  const DayButton({super.key, required this.dt});

  final DateTime dt;

  @override
  State<DayButton> createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  int _timesBrushed = 0;
  int _maxTimesToBrushForDay = 2;

  final Map<int, Color> _timesBrushedCorrespondingColor = {
    0: const Color.fromARGB(255, 228, 226, 226),
    1: Colors.yellow,
    2: Colors.green
  };

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            minimumSize: const Size(50, 80),
            backgroundColor: _timesBrushedCorrespondingColor[_timesBrushed]),
        onPressed: () async {
          int result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DayDetailScreen()));
          setState(() =>
              _timesBrushed > result ? _timesBrushed : _timesBrushed = result);
        },
        child: Text(widget.dt.day.toString()));
  }
}

class DayWidget extends StatefulWidget {
  const DayWidget({super.key, required this.onBrushCompleted});

  final void Function(int) onBrushCompleted;

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  int _timesBrushed = 0;

  bool _showPlaceholder = true;

  final String _lunchPressed = 'LUNCH';
  final String _dinnerPressed = 'DINNER';
  String? _buttonPressed;

  bool _lunchCompleted = false;
  bool _dinnerCompleted = false;

  final Map<bool, Color> _isBrushedCorrespondingColor = {
    false: const Color.fromARGB(255, 228, 226, 226),
    true: Colors.green
  };

  final Map<int, String> _timesBrushedCorrespondingText = {
    0: 'Start',
    1: 'Completed'
  };

  void _notifyTimesBrushCompleted(int timesCompleted) {
    widget.onBrushCompleted(_timesBrushed);
  }

  void _createAlertDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Brushing Time!'),
        content: const Text('Click To Set Brushing Timer'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text(
              'Later',
              selectionColor: Color.fromARGB(255, 54, 244, 149),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              setState(() {
                _showPlaceholder = false;
              });
            },
            child: const Text(
              'Let\'s Go',
              selectionColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  CircularCountDownTimer createCircularCountDownTimer(
      {required String buttonPressed}) {
    return CircularCountDownTimer(
      duration: 6,
      initialDuration: 0,
      controller: CountDownController(),
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 3,
      ringColor: Colors.grey[300]!,
      ringGradient: null,
      fillColor: const Color.fromARGB(255, 128, 252, 140)!,
      fillGradient: null,
      backgroundColor: Color.fromARGB(0, 229, 243, 235),
      backgroundGradient: null,
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: const TextStyle(
          fontSize: 20.0,
          color: Color.fromARGB(255, 25, 201, 78),
          fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.S,
      isReverse: true,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: () {
        debugPrint('Countdown Ended');
        setState(() {
          _showPlaceholder = true;
          switch (buttonPressed) {
            case 'LUNCH':
              _lunchCompleted = true;
              _notifyTimesBrushCompleted(++_timesBrushed);
              break;
            case 'DINNER':
              _dinnerCompleted = true;
              _notifyTimesBrushCompleted(++_timesBrushed);
              break;
            default:
          }
        });
      },
      onChange: (String timeStamp) {
        debugPrint('Countdown Changed $timeStamp');
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "Well Done!";
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            const Text('After Lunch Brushing:'),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  backgroundColor:
                      _isBrushedCorrespondingColor[_lunchCompleted]),
              onPressed: () => {
                setState(() {
                  _buttonPressed = _lunchPressed;
                  _createAlertDialog();
                })
              },
              child: Text(_lunchCompleted
                  ? _timesBrushedCorrespondingText[1]!
                  : _timesBrushedCorrespondingText[0]!),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('After Dinner Brushing:'),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  backgroundColor:
                      _isBrushedCorrespondingColor[_dinnerCompleted]),
              onPressed: () => {
                setState(() {
                  _buttonPressed = _dinnerPressed;
                  _createAlertDialog();
                })
              },
              child: Text(_dinnerCompleted
                  ? _timesBrushedCorrespondingText[1]!
                  : _timesBrushedCorrespondingText[0]!),
            ),
            const SizedBox(
              height: 30,
            ),
            _showPlaceholder
                ? const Text('Complete Your 2/2 Routine')
                : createCircularCountDownTimer(buttonPressed: _buttonPressed!),
          ],
        ),
      ),
    );
  }
}

class DayDetailScreen extends StatefulWidget {
  const DayDetailScreen({super.key});

  @override
  State<DayDetailScreen> createState() => _DayDetailScreenState();
}

class _DayDetailScreenState extends State<DayDetailScreen> {
  int _timesBrushed = 0;

  void _handleTimesBrushed(int timesBrushed) {
    _timesBrushed = timesBrushed;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, _timesBrushed);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Day Details'),
        ),
        body: DayWidget(onBrushCompleted: _handleTimesBrushed),
      ),
    );
  }
}
