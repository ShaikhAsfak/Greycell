
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class addDetails extends StatefulWidget {
  const addDetails({super.key});

  @override
  State<addDetails> createState() => _addDetailsState();
}

class _addDetailsState extends State<addDetails> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  DateTime? _selectedDate;
  String? _gender;

  void _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Details"),
      ),
      body: Column(
        children: [
           TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name',prefixIcon: Icon(Icons.person)),
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
              ),

              SizedBox(height: 30),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email',prefixIcon: Icon(Icons.mail)),
                validator: (value) => value!.isEmpty ? 'Enter email' : null,
              ),

              SizedBox(height: 30),

              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone',prefixIcon: Icon(Icons.phone)),
                validator: (value) => value!.isEmpty ? 'Enter phone' : null,
              ),

              SizedBox(height: 30),

              Row(
                children: [
                    Text("Date of Birth: "),
                    Text(_selectedDate == null
                        ? "Select Date"
                        : "${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}"),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _pickDate(context),
                    ),
                ],
              ),

              SizedBox(height: 30),

              Row(
                children: [
                  Text("Gender: "),
                   Radio(
                    value: "Male",
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  Text("Male"),
                  Radio(
                    value: "Female",
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  Text("Female"),
                ],
              ),
            
            SizedBox(height: 30),
            
            ElevatedButton.icon(
              onPressed: (){
                print("Data Inserted");
              },
              icon: Icon(
                Icons.save,
                size: 10,
              ),
              label: Text(
                "Submit", 
                style: TextStyle(fontSize: 10),
              ),
            ),
        ],
      ),
    );
  }
}