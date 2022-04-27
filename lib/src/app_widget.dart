import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'queue/presenter/pages/queue_page.dart';
import 'queue/queue_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ...queueModule,
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark(),
          home: const QueuePage(),
        ));
  }
}
