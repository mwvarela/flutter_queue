import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/configuration_bloc.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ConfigurationBloc>();
    final state = bloc.state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuração'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FILAS'),
            if (state is ConfigurationLoaded)
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.queues.length,
                  itemBuilder: (context, index) {
                    final queue = state.queues[index];
                    return ListTile(
                      title: Text('${queue.title} - ${queue.abbr}'),
                      subtitle: Text('${queue.priority} de prioridade'),
                    );
                  })
          ],
        ),
      ),
    );
  }
}
