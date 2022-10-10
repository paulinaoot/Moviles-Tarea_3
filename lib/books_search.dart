// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unused_element, prefer_const_constructors, prefer_interpolation_to_compose_strings, todo, must_be_immutable, prefer_adjacent_string_concatenation, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';
import 'package:practica_3/book_details.dart';
import 'package:practica_3/error.dart';
import 'package:practica_3/get_book.dart';

class SearchFilter extends StatefulWidget {
  var d;
  SearchFilter({@required this.d});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  var isbn;
  TextEditingController t = TextEditingController();
  
  getisbn(int index) {
    try {
      setState(() {
        isbn = widget.d["items"][index + 1]["volumeInfo"]["industryIdentifiers"]
            [0]["identifier"];
      });
    } catch (e) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Error();
      }));
    }
  }

  String st(String s) {
    int count = 0;
    String ans = "";
    for (int i = 0; i < s.length; i++) {
      if (count == 20) {
        break;
      }
      count++;
      ans = ans + s[i];
    }
    return ans + "...";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Libreria free to play'),
          backgroundColor: Colors.black54,
          centerTitle: false,
        ),
        body:Column(
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
                          print(t.text);
                          return BookLoading(text: t.text);
                        })));
                    })
                  ),
                ),
              ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  
                ),
                itemCount: widget.d["items"].length -1,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 30,
                      width: 30, 
                      decoration: BoxDecoration(
                        
                        image: DecorationImage(
                          
                          image: NetworkImage(widget.d["items"][index + 1]["volumeInfo"]["imageLinks"]["thumbnail"]),
                          fit: BoxFit.fitHeight
                        ),
                      ),

                      child: Container(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(onTap: (() {
                            getisbn(index); 
                            print(isbn);
                            print(getisbn(index));

                            Navigator.push(context, MaterialPageRoute(builder: (context) { return BookDetails(d: isbn);}));
                            // { return BookLoading(text: isbn);}
                          }),
                          child: Text((widget.d["items"][index + 1]["volumeInfo"]["title"]).length >20
                            ? st(widget.d["items"][index + 1]["volumeInfo"]["title"])
                            : widget.d["items"][index + 1]["volumeInfo"]["title"],
                            overflow: TextOverflow.ellipsis,
                            style: (
                              TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              )
                            )
                          ),
                          )
                          
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]
        )
      ),
    ));
  }
}