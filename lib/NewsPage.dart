import 'package:flutter/material.dart';
import 'package:newsapitask/ShowNews.dart';
import 'package:newsapitask/view_model/list_news_view_model.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  ListNewsViewModel listNewsViewModel = ListNewsViewModel();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("News"),),
              body: FutureBuilder(
                future: listNewsViewModel.fetchNews(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  else {
                    return ListView.builder(
                        reverse: false,
                        shrinkWrap: true,
                        itemCount: listNewsViewModel.list!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var article = listNewsViewModel.list![index];
                          return GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(11)),
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              height: 300,
                                              width: double.maxFinite,
                                              child:Image
                                                  .network(
                                                article.urlToImg.toString(),
                                                width:
                                                double.maxFinite,
                                                fit: BoxFit.fill,

                                                loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
                                                  if (loadingProgress == null) return child;
                                                  return Center(
                                                    child: Image.asset(
                                                        "assets/ic_placeholder.jpg"),
                                                  );
                                                },
                                                errorBuilder: (context, error, stackTrace) => Center(
                                                  child: Image.asset(
                                                      "assets/ic_placeholder.jpg"),
                                                ),
                                              )
                                                 ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                    child: Text(
                                                      article.title.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                              20,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    )),
                                                Row(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          child: Text(
                                                          "Author : "+article.author.toString(),
                                                            style: TextStyle(
                                                                color: Colors.blue,
                                                                fontSize:
                                                                MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                    30,
                                                                fontWeight:
                                                                FontWeight.bold),
                                                          )),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment: Alignment.centerRight,
                                                        child: Container(
                                                            child: Text(
                                                              article.publishedAt!,
                                                              style: TextStyle(
                                                                  color: Colors.blue,
                                                                  fontSize:
                                                                  MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                      30,
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ShowNews(listNewsViewModel.list![index])));
                              });
                        });
                  }

                }
              )
        );
  }
}
