import 'package:flutter/material.dart';

import 'package:timezone/data/latest.dart' as tz;

import 'local_notice_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notification PoC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 197, 234, 214)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Notification PoC Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Map<String, bool> _stateMap = {};

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 5 == 0) {
        print('hey');
        _notifyUserWhenMultipleOfFive(context);
      }
    });
  }

  void _listenSwitchStateChanges(Map<String, bool> stateMap) {
    _stateMap = stateMap;
    print(_stateMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SwitchesGroup(onSwitchStateChange: _listenSwitchStateChanges),
          const SizedBox(
            width: 100,
            height: 50,
          ),
          const Text(
            'Push + button. For every 5 times, notification will pop.',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _notifyUserWhenMultipleOfFive(BuildContext context) {
    for (String key in _stateMap.keys) {
      if (_stateMap[key]!) {
        _invokeNotification(type: key, context: context);
      }
    }
  }

  void _invokeNotification(
      {required String type, required BuildContext context}) {
    switch (type) {
      case 'DIALOG':
        {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Brushing Time!'),
              content: const Text('Time To Brush Your Teeth'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text(
                    'Later',
                    selectionColor: Colors.red,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text(
                    'Let\'s Go',
                    selectionColor: Colors.green,
                  ),
                ),
              ],
            ),
          );
        }
        break;
      case 'TOAST':
        {
          final mySnackBar = SnackBar(
            content: const Text('You made it! Keep Going'),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
        }
        break;
      case 'LOCALPUSH':
        DateTime scheduleTime = DateTime.now().add(const Duration(seconds: 5));
        {
          debugPrint('Notification Scheduled for $scheduleTime');

          NotificationService().scheduleNotification(
              title: 'Flossing Reminder',
              body: 'Hey! Let\'s make these guns healthy!',
              scheduledNotificationDateTime: scheduleTime);
        }
    }
  }
}

class SwitchesGroup extends StatefulWidget {
  final void Function(Map<String, bool> stateMap) onSwitchStateChange;

  const SwitchesGroup({super.key, required this.onSwitchStateChange});

  @override
  State<SwitchesGroup> createState() => _SwitchesGroupState();
}

class _SwitchesGroupState extends State<SwitchesGroup> {
  Map<String, bool> _switchesStateMap = {
    'DIALOG': false,
    'TOAST': false,
    'LOCALPUSH': false
  };

/*   
  bool _switchDialogEnabled = false;
  bool _SwitchToastEnabled = false;
  bool _switchLocalPushEnabled = false; 
*/

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            _createASwitch(state: _switchesStateMap['DIALOG']!, type: 'DIALOG'),
            const Text('DIALOG'),
          ],
        ),
        Row(
          children: [
            _createASwitch(state: _switchesStateMap['TOAST']!, type: 'TOAST'),
            const Text('TOAST'),
          ],
        ),
        Row(
          children: [
            _createASwitch(
                state: _switchesStateMap['LOCALPUSH']!, type: 'LOCALPUSH'),
            const Text('LOCALPUSH'),
          ],
        ),
      ],
    );
  }

  bool getSwitchState({String? type}) {
    bool stateGotten;

    switch (type) {
      case 'DIALOG':
        stateGotten = _switchesStateMap['DIALOG']!;
        break;
      case 'TOAST':
        stateGotten = _switchesStateMap['TOAST']!;
        break;
      case 'LOCALPUSH':
        stateGotten = _switchesStateMap['LOCALPUSH']!;
        break;
      default:
        stateGotten = false;
    }

    return stateGotten;
  }

  Switch _createASwitch({bool state = false, String? type}) {
    return Switch(
      value: state,
      activeColor: Colors.green,
      onChanged: (value) {
        setState(() {
          if (value) {
            switch (type) {
              case 'DIALOG':
                {
                  // _switchDialogEnabled = true;
                  _switchesStateMap['DIALOG'] = true;
                  // _SwitchToastEnabled = false;
                  _switchesStateMap['TOAST'] = false;
                  //  _switchLocalPushEnabled = false;
                  _switchesStateMap['LOCALPUSH'] = false;
                }
                break;
              case 'TOAST':
                {
                  // _switchDialogEnabled = false;
                  _switchesStateMap['DIALOG'] = false;
                  //  _SwitchToastEnabled = true;
                  _switchesStateMap['TOAST'] = true;
                  //  _switchLocalPushEnabled = false;
                  _switchesStateMap['LOCALPUSH'] = false;
                }
                break;
              case 'LOCALPUSH':
                {
                  // _switchDialogEnabled = false;
                  _switchesStateMap['DIALOG'] = false;
                  //  _SwitchToastEnabled = false;
                  _switchesStateMap['TOAST'] = false;
                  // _switchLocalPushEnabled = true;
                  _switchesStateMap['LOCALPUSH'] = true;
                }
            }
            widget.onSwitchStateChange(_switchesStateMap);
          } else {
            switch (type) {
              case 'DIALOG':
                {
                  // _switchDialogEnabled = false;
                  _switchesStateMap['DIALOG'] = false;
                }
                break;
              case 'TOAST':
                {
                  //  _SwitchToastEnabled = false;
                  _switchesStateMap['TOAST'] = false;
                }
                break;
              case 'LOCALPUSH':
                {
                  // _switchLocalPushEnabled = false;
                  _switchesStateMap['LOCALPUSH'] = false;
                }
            }
            widget.onSwitchStateChange(_switchesStateMap);
          }
        });
      },
    );
  }
}
