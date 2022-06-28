import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final onChanged;
  final hintText;

  SearchBar({this.onChanged,this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(

          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
          hintText: hintText,
          hintStyle: TextStyle(color: Color.fromARGB(115, 46, 46, 46)),

        ),
      ),
    );
  }
}
