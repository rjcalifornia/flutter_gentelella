import 'package:flutter/material.dart';
import 'package:flutter_gentelella/constants/page_titles.dart';
import 'package:flutter_gentelella/widgets/app_scaffold.dart';

class GeneralFormsPage extends StatefulWidget {
  GeneralFormsPage({Key key}) : super(key: key);

  @override
  _GeneralFormsPageState createState() => _GeneralFormsPageState();
}

class _GeneralFormsPageState extends State<GeneralFormsPage> {
  DateTime selectedDate = DateTime.now();
  var birthdate = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1940, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        birthdate.text = selectedDate.toIso8601String().split('T')[0];
      });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return AppScaffold(
        pageTitle: PageTitles.forms,
        body: new GestureDetector(
            onTap: () {
              // call this method here to hide soft keyboard
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
              child: Container(
                color: Color(0xffF5F6F5),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 26.0),
                      child: Column(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xffffffff),
                          padding: EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'Form Design',
                                style: TextStyle(
                                    color: Color(0xff313945),
                                    fontSize: 14.08,
                                    fontWeight: FontWeight.w200),
                              ),
                              Divider(),
                              Text(
                                'Different form elements sample',
                                style: TextStyle(
                                    color: Color(0xff313945),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w100),
                              ),
                              SizedBox(
                                height: 28.0,
                              ),
                              Container(
                                padding: width < 1200
                                    ? EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0)
                                    : EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 180.0),
                                child: Column(
                                  children: [
                                    TextField(
                                      style:
                                          TextStyle(color: Color(0xff313945)),
                                      decoration: InputDecoration(
                                          labelText: 'First Name *',
                                          prefixIcon: Icon(Icons.person_add)),
                                    ),
                                    SizedBox(
                                      height: 28,
                                    ),
                                    TextField(
                                      style:
                                          TextStyle(color: Color(0xff313945)),
                                      decoration: InputDecoration(
                                          labelText: 'Last Name *',
                                          prefixIcon: Icon(Icons.person)),
                                    ),
                                    SizedBox(
                                      height: 28,
                                    ),
                                    GestureDetector(
                                      onTap: () => _selectDate(context),
                                      child: AbsorbPointer(
                                        child: TextField(
                                          style: TextStyle(
                                              color: Color(0xff313945)),
                                          controller: birthdate,
                                          decoration: InputDecoration(
                                              labelText: 'Date Of Birth *',
                                              prefixIcon: Icon(Icons.cake)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            )));
  }
}
