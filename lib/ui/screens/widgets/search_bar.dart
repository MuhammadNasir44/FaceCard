import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),
            hintText: "Search Million Number Of. Zaps",
            hintStyle: TextStyle(color: Color.fromARGB(115, 46, 46, 46)),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
        ),
      ),
    );
  }
}
