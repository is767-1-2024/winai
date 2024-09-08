
import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget{
  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final _formKey = GlobalKey<FormState>(); 
  String? _firstName;
  int _firstNameLength = 0;

  String? _familyName;
  int _familyNameLength = 0;

  bool _showPassword = false;


  String? _validateTextFormField(String fieldName, String? value, int length) {
    if (value!.isEmpty) {
      return 'Please enter your $fieldName.';
    }

    if (value.length < length) {
      return '$fieldName length must longer than $length.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Fourth Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'First Name',
                  suffixText: '$_firstNameLength',
                ),
                validator: (value) => _validateTextFormField('Firstname', value, 2),
                onSaved: (newValue) => _firstName = newValue,
                onChanged: (value) {
                  setState(() {
                    _firstNameLength = value.characters.length;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(Icons.group),
                  hintText: 'Enter your family name',
                  labelText: 'Family Name',
                  suffixText: '$_familyNameLength',
                ),
                validator: (value) => _validateTextFormField('Familyname', value, 5),
                onSaved: (newValue) => _familyName = newValue,
                onChanged: (value) => setState(() {
                  _familyNameLength = value.characters.length;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  suffixIcon: GestureDetector(
                    onLongPress: () async {
                      setState(() {
                        _showPassword = true;
                      });

                      await Future.delayed(
                        Duration(
                          seconds: 5,
                        ),
                      );

                      setState(() {
                        _showPassword = false;
                      });
                    },
                    child: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                
                      _formKey.currentState!.save();
                
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Hello $_firstName $_familyName'),
                        ),
                      );
                    },
                    child: Text('Submit'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: Text('Reset'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}