import 'package:flutter/material.dart';
import 'package:flutter_queue/src/home/presenter/pages/home_page.dart';
import 'package:flutter_queue/src/queue/presenter/pages/queue_page.dart';
import 'package:provider/provider.dart';

import 'checkin/checkin_module.dart';
import 'queue/queue_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...queueModule,
        ...checkinModule,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        routes: <String, WidgetBuilder>{
          '/': (_) => const HomePage(),
          '/queues': (_) => const QueuePage(),
        },
      ),
    );
  }
}
