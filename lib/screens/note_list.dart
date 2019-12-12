import 'package:flutter/material.dart';
import 'package:flutter_note_keeper/screens/note_detail.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NoteListState();
  }
}

class _NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Keeper'),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint('FAB clicked');
          navigateToDetail('Add Note');
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text('Dummy Title', style: textStyle),
              subtitle: Text('Dummy Date'),
              trailing: Icon(Icons.delete, color: Colors.grey),
              onTap: () {
                debugPrint('Tapped $count');
                navigateToDetail('Edit Note');
              },
            ),
          );
        });
  }

  void navigateToDetail(String title) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return NoteDetail(title);
        }
    ));
  }
}
