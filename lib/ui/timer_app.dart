import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sba7okora/provider/timer_viewmodel.dart';
import 'package:sba7okora/ui/component/timer_label_text.dart';

class TimerApp extends StatefulWidget {
  static const String routeName = 'timerAApp';
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimerViewModel()..beginTimer(),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          title: const Text(
            'Timer',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
          ),
          backgroundColor: const Color(0xFF0a0a0a),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<TimerViewModel>(
                    builder: (context, value, child) => TimerLabelText(
                        label: 'MIN',
                        timevalue: (value.secondsPassed ~/ 60)
                            .toString()
                            .padLeft(2, '0')),
                  ),
                  Consumer<TimerViewModel>(
                    builder: (context, value, child) => TimerLabelText(
                        label: 'SEC',
                        timevalue: (value.secondsPassed % 60)
                            .toString()
                            .padLeft(2, '0')),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: 47,
                    margin: const EdgeInsets.all(8),
                    child: Consumer<TimerViewModel>(
                      builder: (context, value, child) => MaterialButton(
                        color: Colors.pink[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: const Text('Restart'),
                        onPressed: () {
                          value.secondsPassed = 0;
                          value.isActive = true;
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: 47,
                    margin: const EdgeInsets.all(8),
                    child: Consumer<TimerViewModel>(
                      builder: (context, value, child) => MaterialButton(
                        color: Colors.pink[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(value.isActive ? 'STOP' : 'START'),
                        onPressed: () {
                          value.isActive = !value.isActive;
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: 47,
                    margin: const EdgeInsets.all(8),
                    child: MaterialButton(
                      color: Colors.pink[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: const Text('Cancel'),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

