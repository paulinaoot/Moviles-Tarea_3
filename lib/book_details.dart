// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, dead_code, empty_statements, todo, use_key_in_widget_constructors, must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';


class BookDetails extends StatefulWidget {
  var d;
  BookDetails({@required this.d});

  @override
  State<BookDetails> createState() => _BookDetails();
}

class _BookDetails extends State<BookDetails>{
  TextEditingController t = TextEditingController();
  var pagecount = "Not available";
  var desc = "Not available";
  var pubdate = "Not available";
  var tittle = "Not available";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpagecount();
    getdesc();
    getpubdate();

  }


  void getpubdate() {
    try {
      setState(() {
        pubdate =
            widget.d["items"][0]["volumeInfo"]["publishedDate"].toString();
      });
    } catch (e) {
      setState(() {
        pubdate = "Not available";
      });
    }
  }

    void gettitle() {
    try {
      setState(() {
        tittle = widget.d["items"][0]["volumeInfo"]["title"].toString();
            widget.d["items"][0]["volumeInfo"]["publishedDate"].toString();
      });
    } catch (e) {
      setState(() {
        tittle = "Not available";
      });
    }
  }

  void getdesc() {
    try {
      setState(() {
        desc = widget.d["items"][0]["volumeInfo"]["description"];
      });
    } catch (e) {
      setState(() {
        desc = "Not available";
      });
    }
  }

  void getpagecount() {
    try {
      setState(() {
        pagecount = widget.d["items"][0]["volumeInfo"]["pageCount"].toString();
      });
    } catch (e) {
      setState(() {
        pagecount = "Not available";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Detalles del libro'),
        backgroundColor: Colors.black54,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            
            icon: Icon(
              Icons.public,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              // do somethidis
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 30),
              Image(
                height: MediaQuery.of(context).size.height / 4 + 100,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage('https://static.vecteezy.com/system/resources/previews/001/130/519/non_2x/blank-book-background-vector.jpg')
              ),
              SizedBox(height: 40),
              Text(style: TextStyle(fontSize: 22),"Apple Crush"),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(12)),
                  Text(style: TextStyle(fontWeight: FontWeight.bold), pubdate),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(12)),
                  Text(style: TextStyle(), pagecount),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(23),
                  child: Text(style: TextStyle(), desc, overflow: TextOverflow.ellipsis,maxLines: 10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}