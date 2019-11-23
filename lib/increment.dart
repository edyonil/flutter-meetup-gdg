import 'package:flutter/material.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/increment.bloc.dart';

class Increment extends StatefulWidget {
  @override
  _IncrementState createState() => _IncrementState();
}

class _IncrementState extends State<Increment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tela increment"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: BlocProvider.of<IncrementBloc>(context).incrementValueStream,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${snapshot.data}',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text("Increment"),
              onPressed: () {
                BlocProvider.of<IncrementBloc>(context).incrementeValue();
              },
            )
              ],
            );
          }
        ),
      ),
    );
  }
}