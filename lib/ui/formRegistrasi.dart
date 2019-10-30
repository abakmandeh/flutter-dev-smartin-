import 'package:flutter/material.dart';
import 'package:flutter_developer_test/model/registrasi.dart';
import 'package:flutter_developer_test/api/api_service.dart';
import 'package:flutter_developer_test/ui/listUi.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormRegistrasi extends StatefulWidget {
  Registrasi registrasi;

  FormRegistrasi({this.registrasi});

  @override
  _FormRegistrasiState createState() => _FormRegistrasiState();
}

class _FormRegistrasiState extends State<FormRegistrasi> {
  bool _isLoading = false;
  ApiService _apiService = ApiService();

  bool _isFieldUserIdValid;
  bool _isFieldIdValid;
  bool _isFieldTitleValid;
  bool _isFieldCompletedValid;

  TextEditingController _controllerUserId = TextEditingController();
  TextEditingController _controllerId = TextEditingController();
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerCompleted = TextEditingController();

  @override
  void initState() {
    if (widget.registrasi != null) {
      _isFieldUserIdValid = true;
      _controllerUserId.text = widget.registrasi.userId.toString();
      _isFieldIdValid = true;
      _controllerId.text = widget.registrasi.id.toString();
      _isFieldTitleValid = true;
      _controllerTitle.text = widget.registrasi.title;
      _isFieldCompletedValid = true;
      _controllerCompleted.text = widget.registrasi.completed.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      resizeToAvoidBottomPadding: false,
      body: new Center(
        child: Container(
          padding: EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _textJudul(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _buildTextFieldUserId(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _buildTextFieldId(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _buildTextFieldTitle(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _buildTextFieldComplete(),
              ),
              // _buildTextFieldUserId(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _textAccount(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: _textTerm(),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ButtonTheme(
                  minWidth: 340.0,
                  height: 55.0,
                  child: RaisedButton(
                    child: Text(
                      //widget.registrasi == null
                      // ? "Submit".toUpperCase()
                      // : "Update Data".toUpperCase(),
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      if (_isFieldUserIdValid == null ||
                          _isFieldIdValid == null ||
                          _isFieldTitleValid == null ||
                          _isFieldCompletedValid == null ||
                          !_isFieldUserIdValid ||
                          !_isFieldIdValid ||
                          !_isFieldTitleValid ||
                          !_isFieldCompletedValid) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Please fill all field"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                      //Use`Navigator` widget to push the second screen to out stack of screens
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                        return new ListData();
                      }));
                    },
                    color: Colors.teal[600],
                  ),
                ),
              )
            ],
          ),
        ),
        // _isLoading
        //     ? Stack(
        //         children: <Widget>[
        //           Opacity(
        //             opacity: 0.3,
        //             child: ModalBarrier(
        //               dismissible: false,
        //               color: Colors.grey,
        //             ),
        //           ),
        //           Center(
        //             child: CircularProgressIndicator(),
        //           ),
        //         ],
        //       )
        //     : Container(),
        // ],
        // ),
      ),
    );
  }

  Widget _textJudul() {
    return Text(
      'Fill in your first name, \nlast name, email, \nand password',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
    );
  }

  Widget _textAccount(){
    return Center(
      child:
      Text.rich(
      TextSpan(
        //text: 'Hello', // default text style
        children: <TextSpan>[
          TextSpan(
            text: 'Already have anaccount ? ',
          ),
          TextSpan(
              text: 'Sign in',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.greenAccent)),
          TextSpan(
            text: ' to carrier anaccount ? ',
          ),
        ],
      ),
    ),
    );
  }

  Widget _textTerm() {
    return Text('Terms Of Use & Privacy Policy', textAlign: TextAlign.center, );
  }

  Widget _buildTextFieldUserId() {
    return TextField(
      controller: _controllerUserId,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        // labelText: "First Name",
        hintText: "First Name",
        border: OutlineInputBorder(),
        errorText: _isFieldUserIdValid == null || _isFieldUserIdValid
            ? null
            : "First Name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldUserIdValid) {
          setState(() => _isFieldUserIdValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldId() {
    return TextField(
      controller: _controllerId,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "First Name",
        border: OutlineInputBorder(),
        errorText: _isFieldIdValid == null || _isFieldIdValid
            ? null
            : "Last Name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldIdValid) {
          setState(() => _isFieldIdValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldTitle() {
    return TextField(
      controller: _controllerTitle,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Email",
        border: OutlineInputBorder(),
        errorText: _isFieldTitleValid == null || _isFieldTitleValid
            ? null
            : "Email is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldTitleValid) {
          setState(() => _isFieldTitleValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldComplete() {
    return TextField(
      controller: _controllerCompleted,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Password",
        border: OutlineInputBorder(),
        errorText: _isFieldCompletedValid == null || _isFieldCompletedValid
            ? null
            : "Password is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldCompletedValid) {
          setState(() => _isFieldCompletedValid = isFieldValid);
        }
      },
    );
  }
}
