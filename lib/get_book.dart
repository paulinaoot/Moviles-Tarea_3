// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, camel_case_types, use_key_in_widget_constructors, avoid_print, use_build_context_synchronously, todo

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practica_3/books_search.dart';

class BookLoading extends StatefulWidget {
 var text;
  BookLoading({@required this.text});

  @override
  State<BookLoading> createState() => _BookLoadingState();
}

class _BookLoadingState extends State<BookLoading> {
  var cp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  
  void getData() async{
    

    Response r = await get(
      Uri.parse('https://www.googleapis.com/books/v1/volumes?q=intitle:${widget.text}&maxResult=50&download=epub&orderBy=newest&key=AIzaSyCM5E-JhtlsRK5EPf2gWyQ-NK_HnjvGXRM')
    );
    cp = jsonDecode(r.body);
    print(cp);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return //BookDetails(d: cp);
      SearchFilter(d:cp);
    }));
    return;
  }
  @override
  Widget build(BuildContext context){
    return (const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    ));
  }
}