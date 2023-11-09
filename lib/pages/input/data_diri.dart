import 'package:flutter/material.dart';

class DataDiriPages extends StatelessWidget {
  const DataDiriPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text('Data Diri'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: Colors.grey[900],
                showCursor: true,
                decoration: InputDecoration(
                  label: Text("Nama Lengkap"),
                  labelStyle: TextStyle(color: Colors.grey[900]),
                  fillColor: Colors.grey[900],
                  focusColor: Colors.grey[900],
                  iconColor: Colors.grey[900],
                  hoverColor: Colors.grey[900],
                  icon: Icon(Icons.person, size: 35),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade900)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade900)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.grey[900],
                  showCursor: true,
                  decoration: InputDecoration(
                    label: Text("No WhatsApp"),
                    labelStyle: TextStyle(color: Colors.grey[900]),
                    fillColor: Colors.grey[900],
                    focusColor: Colors.grey[900],
                    iconColor: Colors.grey[900],
                    hoverColor: Colors.grey[900],
                    icon: Icon(
                      Icons.call,
                      size: 35,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade900)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade900)),
                  )),
              SizedBox(
                height: 20,
              ),
              TextField(
                  minLines: 2,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  cursorColor: Colors.grey[900],
                  showCursor: true,
                  decoration: InputDecoration(
                    label: Text("Pesan Darurat"),
                    labelStyle: TextStyle(color: Colors.grey[900]),
                    fillColor: Colors.grey[900],
                    focusColor: Colors.grey[900],
                    iconColor: Colors.grey[900],
                    hoverColor: Colors.grey[900],
                    icon: Icon(
                      Icons.message,
                      size: 35,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade900)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade900)),
                  )),
              SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.save),
                label: Text("Save"),
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey[900])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
