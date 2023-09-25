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
    var playerName = ModalRoute.of(context)?.settings.arguments as String;
    return ChangeNotifierProvider<TimerViewModel>(
      create: (context) => TimerViewModel()..beginTimer(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Timer',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// player Name
             Consumer<TimerViewModel>(
               builder: (context, value, child) => Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: Text(
                       value.showName ?  playerName : '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
             ),
              const SizedBox(
                height: 60,
              ),
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
                          value.secondsPassed = 30;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width:  MediaQuery.of(context).size.width * 0.40,
                    height: 47,
                    margin: const EdgeInsets.all(8),
                    child: Consumer<TimerViewModel>(
                      builder: (context, value, child) => MaterialButton(
                        color: Colors.pink[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(value.showName ? 'Hide Name' : 'Show Name'),
                        onPressed: () {
                          value.showName = !value.showName;
                        },
                      ),
                    ),
                  ),
                  Container(
                    width:  MediaQuery.of(context).size.width * 0.40,
                    height: 47,
                    margin: const EdgeInsets.all(8),
                    child: Consumer<TimerViewModel>(
                      builder: (context, value, child) => MaterialButton(
                        color: Colors.pink[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text('Add 5 second'),
                        onPressed: () {
                          value.secondsPassed +=5;
                        },
                      ),
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

