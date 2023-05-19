import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class SearchWidget extends StatelessWidget {
  TextEditingController textController;
  SearchWidget({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      
      child: Container(

        width: MediaQuery.of(context).size.width*0.2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white
            ),
            boxShadow: [
              BoxShadow(
                  color:
                      const Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 5))
            ]),
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            errorBorder: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(fontSize: 14),
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              
              borderSide: BorderSide.none,
            
              borderRadius: BorderRadius.circular(15),
        
            )
          ),)
      ),
    );
  }
}
