import 'package:flutter/material.dart';
import 'package:newsapitask/view_model/list_news_view_model.dart';

class ShowNews extends StatefulWidget {
  NewsViewModel? articles;


  ShowNews(this.articles);

  @override
  _ShowNewsState createState() => _ShowNewsState();
}

class _ShowNewsState extends State<ShowNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.articles!.sourceName!),),
        body: Padding(
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
                          widget.articles!.urlToImg!,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                                widget.articles!.title!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                    MediaQuery.of(context)
                                        .size
                                        .width /
                                        23,
                                    fontWeight:
                                    FontWeight.bold),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              child: Text(
                                widget.articles!.content.toString(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize:
                                    MediaQuery.of(context)
                                        .size
                                        .width /
                                        25,
                                    fontWeight:
                                    FontWeight.bold),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          widget.articles!.author != null ? Container(
                              child: Text(
                                "Author: "+widget.articles!.author.toString(),
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize:
                                    MediaQuery.of(context)
                                        .size
                                        .width /
                                        25,
                                    fontWeight:
                                    FontWeight.bold),
                              )) : Container(),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
