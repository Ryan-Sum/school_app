import 'package:flutter/material.dart';

class ExtracurricularScreen extends StatelessWidget {
  const ExtracurricularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('Tennis Tryouts'),
              ),
              subtitle: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    'Tennis tryouts will be January 25 @ 4:30. Email Coach Severy for more information.'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('Band Concert'),
              ),
              subtitle: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    'Steinbrenner\'s band will be hosting a concert on 2/5 at 5:30. Be sure to be there!'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('College Fair'),
              ),
              subtitle: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    'Many colleges from across the state will be coming to Steinbrenner on 3/10. Be there to ask them any questions you may have'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
