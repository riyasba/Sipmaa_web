import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/controllers/posts_controller.dart';
import 'package:reg_login/app/data/components/search_field.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets/continers/comentcontiner.dart';
//import 'package:staggered_grid_view_flutter/staggered_grid_view_flutter.dart';
//import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
//import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../../../../data/components/constands/constands.dart';

//import '../constands.dart';
class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  bool _isfavorite = false;
  bool _isfavorite2 = false;
  var searchController = TextEditingController();

  var searchtextController = TextEditingController();

  final postsController = Get.find<PostsController>();

  @override
  void initState() {
    super.initState();
    searchtextController.addListener(searchUsers);
  }

  searchUsers() {
    if (searchtextController.text.trim().isNotEmpty) {
      postsController.searchPost(keyWord: searchtextController.text);
    } else {
      postsController.searchPosts.clear();
      postsController.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<PostsController>(builder: (_) {
      return Container(
        height: 600, // MediaQuery.of(context).size.height * 0.88,
        width: 500, //MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            color: kwhite,
            boxShadow: <BoxShadow>[
              BoxShadow(offset: Offset(0.0, 0.7), blurRadius: 0.5, color: kgrey)
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(children: [
                Text(
                  'Search',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ]),
            ),
            ksizedbox30,
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.36,
                  decoration: BoxDecoration(
                      color: kwhite.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: kgrey,
                            blurRadius: 1.5,
                            offset: const Offset(0.0, 0.75))
                      ]),
                  child: TextField(
                    controller: searchtextController,
                    decoration: InputDecoration(
                        errorBorder: InputBorder.none,
                        hintText: 'Search...',
                        hintStyle: TextStyle(fontSize: 14),
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        )),
                  )),
            ),
            ksizedbox30,
            SizedBox(
              height: 400,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.only(left: 23, right: 20),
                child: postsController.searchPosts.isEmpty &&
                        searchtextController.text.isNotEmpty
                    ? Center(
                        child: Text("No data"),
                      )
                    : GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: postsController.searchPosts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              postsController.getComments(
                                  postId: postsController.searchPosts[index].id
                                      .toString());

                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 110),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 350,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            decoration:
                                                BoxDecoration(color: kwhite),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Row(
                                                    children: [
                                                      Image.network(
                                                        postsController
                                                            .searchPosts[index]
                                                            .mediaUrl,
                                                        fit: BoxFit.contain,
                                                        width: size.width * 0.3,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 35, left: 20),
                                                  child: Container(
                                                    height: 300,
                                                    width: 300,
                                                    child: GetBuilder<
                                                            PostsController>(
                                                        builder: (_) {
                                                      return ListView.builder(
                                                        shrinkWrap: true,
                                                        itemBuilder: (context,
                                                                index) =>
                                                            comentsContainer(
                                                          commentsList:
                                                              postsController
                                                                      .commentsList[
                                                                  index],
                                                        ),
                                                        itemCount:
                                                            postsController
                                                                .commentsList
                                                                .length,
                                                      );
                                                    }),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Card(
                              child: Image.network(
                                  postsController.searchPosts[index].mediaUrl),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
