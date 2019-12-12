import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {

  String appBarTitle;

  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return _NoteDetailState(this.appBarTitle);
  }
}

class _NoteDetailState extends State {

  String appBarTitle;

  _NoteDetailState(this.appBarTitle);

  var _priorities = ['High', 'Medium', 'Low'];
  var _selectedPriority = '';
  var _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    _selectedPriority = _priorities[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;
    return WillPopScope(
      onWillPop: () {
        // when user presses the back button
        navigateToLastScreen();
      },
        child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          navigateToLastScreen();
        },),
      ),
      body: Form(
          key: _formKey, child: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: <Widget>[
              DropdownButton<String>(
                items: _priorities.map((String priority) {
                  return DropdownMenuItem<String>(
                      value: priority, child: Text(priority, style: textStyle));
                }).toList(),
                onChanged: (String priority) {
                  setState(() {
                    _selectedPriority = priority;
                  });
                },
                value: _selectedPriority,
              ),
              Container(width: 10.0),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TextFormField(
                  style: textStyle,
                  validator: (String value) {
                    if (value.isEmpty) return 'Please enter title';
                  },
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: 'Enter title',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TextFormField(
                  style: textStyle,
                  validator: (String value) {
                    if (value.isEmpty) return 'Please enter Description';
                  },
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Enter Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      elevation: 6.0,
                      color: Theme
                          .of(context)
                          .primaryColorDark,
                      textColor: Theme
                          .of(context)
                          .primaryColorLight,
                      child: Text(
                          'Save',
                          textScaleFactor: 1.5
                      ),
                      onPressed: () {
                        setState(() {
                          if(_formKey.currentState.validate())
                            debugPrint('Saved');
                        });
                      },
                    ),
                  ),
                  Container(width: 10),
                  Expanded(
                    child: RaisedButton(
                      elevation: 6.0,
                      color: Theme
                          .of(context)
                          .primaryColorDark,
                      textColor: Theme
                          .of(context)
                          .primaryColorLight,
                      child: Text(
                          'Delete',
                          textScaleFactor: 1.5
                      ),
                      onPressed: () {
                        debugPrint('Deleted');
                      },
                    ),
                  )
                ],
              )
            ],
          ))),
    ));
  }

  void navigateToLastScreen() {
    Navigator.pop(context);
  }
}
