import 'package:flutter/material.dart';
import 'package:reg_login/widget/search_field.dart';
//import 'package:staggered_grid_view_flutter/staggered_grid_view_flutter.dart';
//import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
//import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../../../../../constands.dart';
//import '../constands.dart';
class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  bool _isfavorite=false; 
bool _isfavorite2=false; 
var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.88,
      width: MediaQuery.of(context).size.width*0.4,
      decoration: BoxDecoration(
         color: kwhite,
         boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0.0, 0.7),
            blurRadius: 0.5,
            color: kgrey
          )
         ],
         borderRadius: BorderRadius.circular(10)
      ),
     
      child: Column(
        children: [
          ksizedbox10,
         
           Padding(
             padding: const EdgeInsets.only(top: 20,left: 20),
             child: Row(children:[
                Text('Search',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
           
                ]),
           ),
              ksizedbox30,
              SizedBox(
               width: 20,
              ),
              Container(
               height: 40,
                width: MediaQuery.of(context).size.width*0.36,
                decoration: BoxDecoration(
                    color: kwhite.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                   
                    boxShadow: [
                      BoxShadow(
                          color:kgrey,
                        
                          blurRadius: 1.5,
                          offset: const Offset(0.0, 0.75))
                    ]),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    errorBorder: InputBorder.none,
                    hintText: 'Search...',
                    hintStyle: TextStyle(fontSize: 14),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      
                      borderSide: BorderSide.none,
                    
                      borderRadius: BorderRadius.circular(15),
                
                    )
                  ),)
              ),
              ksizedbox30,
              Padding(
                padding: const EdgeInsets.only(left: 23,right: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                      
                        children: [
                          Container(
                          child: Image.asset('assets/images/searchimage1.png'),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              
                            child: Image.asset('assets/images/searchimage3.png'),
                            ),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
             
        ]
      )
    );
  }
}