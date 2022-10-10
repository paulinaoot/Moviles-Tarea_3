// ignore_for_file: use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, todo, prefer_typing_uninitialized_variables, must_be_immutable, avoid_print, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, use_full_hex_values_for_flutter_colors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:practica_3/get_book.dart';

class HomePage extends StatefulWidget {


  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController t = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(widget.c1);
  }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        appBar: AppBar(
          title: const Text('Libreria free to play'),
          backgroundColor: Colors.black54,
          centerTitle: false,
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: t,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa titulo',
                  labelText: 'Ingresa titulo',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (() {
                      Navigator.push(
                        context, MaterialPageRoute(builder: ((context) {
                          return BookLoading(text: t.text);
                        })));
                    })
                  ),
                ),
              ),

              SizedBox(height: 300),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ingrese palabra para buscar libro"),
                ],
              ), 
            ],
          )
        )
      ) 
    );
  }
}
