import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  final hinttext;
  final prefixIcon;

  customTextField({
    this.hinttext,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        // minLines: ,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
          hintText: hinttext,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff999999), width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff999999), width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          prefixIcon: prefixIcon,
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff999999), width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
