import 'package:flutter/material.dart';
import 'package:workservices/Bloc/localsBloc.dart';
import 'package:workservices/DAL/StorageLocals.dart';

class EditLocal extends StatefulWidget {
  @override
  _EditLocalState createState() => _EditLocalState();
}

class _EditLocalState extends State<EditLocal> {
  StorageLocals _storage = new StorageLocals(); 
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfController = TextEditingController();
  final LocalBloc _local = new LocalBloc();
  @override
  void dispose(){
    super.dispose();
    _local.dispose();
  }

  Widget _wForm(
      String name, IconData ico, bool p, TextEditingController control) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            controller: control,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                ico,
                color: Colors.white,
              ),
              hintText: 'Ingrese su ' + name.toLowerCase(),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Verifique los campos';
              }
            },
          ),
        )
      ],
    );
  }

  Widget _registerBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => _saveLocalInfo()? Tooltip(message: "se fue"): Tooltip(message: "null"),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.blue,
        child: Text(
          'Add info',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.blue,
          ),
          preferredSize: Size.fromHeight(0.1)),
      body: Form(
          key: _formKey,
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.9,
                child: Container(
//                  height: double.infinity,
//                  width: double.infinity,
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      begin: Alignment.topCenter,
//                      end: Alignment.bottomCenter,
//                      colors: [
//                        Color(0xFF73AEF5),
//                        Color(0xFF61A4F1),
//                        Color(0xFF478DE0),
//                        Color(0xFF398AE5),
//                      ],
//                      stops: [0.1, 0.4, 0.7, 0.9],
//                    ),
//                    boxShadow: [BoxShadow(color: Colors.black)],
//                    image: DecorationImage(
//                      image: AssetImage('assets/glorieta.jpg'),
//                      colorFilter:
//                      ColorFilter.mode(Colors.black, BlendMode.dstATop),
//                      alignment: Alignment.center,
//                      centerSlice: Rect.largest,
//                    ),
//                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Text("Edit local first time", style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),),
                      _wForm('Nombre', Icons.title, false, _emailController,),
                      SizedBox(
                        height: 20.0,
                      ),
                      _wForm('Descripcionn', Icons.toc, true, _passController,),
                      SizedBox(
                        height: 5,
                      ),
                      _wForm('horario', Icons.calendar_today, true, _passConfController,),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(height: 30.0),
                      _registerBtn(),
                    ],
                  ),
                ),
              )
            ],
      )
      ),
    );
  }
  
  bool _saveLocalInfo(){
    if (_formKey.currentState.validate() == true) {
      _storage.saveToDatabase(_emailController.text,_passController.text,_passConfController.text);
      return true;
    }else{
      return false;
    }
  }
}
