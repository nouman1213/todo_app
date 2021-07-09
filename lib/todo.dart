import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<dynamic> lst = [1, 2, 3, 4, 5, 6];
  var output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(child: Text("TODO APP")),
      ),
      body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context, index) {
          return Container(
            height: 70,
            margin: EdgeInsets.only(top: 15, left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
            ),
            child: ListTile(
              title: Text(
                "${lst[index]}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Container(
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            lst.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete, color: Colors.white)),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Edit Item"),
                                  content: TextField(onChanged: (value) {
                                    output = (value);
                                  }),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            lst.replaceRange(
                                                index, index + 1, {output});
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Edit Item"))
                                  ],
                                );
                              });
                        },
                        child: Icon(Icons.edit, color: Colors.white)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Center(child: Text("Add Item")),
                  content: TextField(
                    onChanged: (value) {
                      output = (value);
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          lst.add(output);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Add Item"),
                    ),
                  ],
                );
              });
        },
        child: Text("Add"),
      ),
    );
  }
}
