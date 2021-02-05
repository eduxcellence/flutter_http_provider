import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_http_provider/background/background.dart';
import 'package:flutter_http_provider/constant/colors.dart';
import 'package:flutter_http_provider/model/jobs_model.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetail extends StatelessWidget {
  final JobsModel data;

  JobDetail(this.data);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(""),
        backgroundColor: Colours.primaryColor,
        leading: GestureDetector(onTap: ()
          {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            size: 23,
          ),
        ),
      ),
      body: Container(
        color: Colours.primaryColor,
        child: Hero(
            tag: data.id,
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Colours.itemComLogoColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16))),
                              child: Image(
                                  height: 45,
                                  fit: BoxFit.fitWidth,
                                  color: Colours.itemComLogoColor,
                                  width: 50,
                                  colorBlendMode: BlendMode.color,
                                  image: CachedNetworkImageProvider(
                                    data.companyLogo ??
                                        "https://image.freepik.com/free-psd/engraved-black-logo-mockup_125540-223.jpg",
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      data.title.split("(").first,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colours.primaryColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data.company,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colours.itemComLogoColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    data.companyUrl ?? "",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colours.itemComLogoColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text.rich(TextSpan(
                                text:
                                    "${((data.location.length)).roundToDouble()} ",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colours.primaryColor,
                                    fontWeight: FontWeight.bold),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'l.p.a*',
                                    style: TextStyle(
                                        fontSize: 7,
                                        color: Colours.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 5, right: 5, top: 10, bottom: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                data.type,
                                style: new TextStyle(
                                    fontSize: 9, color: Colours.primaryColor),
                              ),
                            ),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: Colours.searchTextColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 5, right: 5, top: 10, bottom: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                data.location,
                                style: new TextStyle(
                                    fontSize: 9, color: Colours.primaryColor),
                              ),
                            ),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: Colours.searchTextColor,
                            ),
                          ),
                          Spacer(),
                          Tooltip(
                              message: "Bookmark Job",
                              decoration: BoxDecoration(
                                  color: Colours.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              textStyle:
                                  TextStyle(fontSize: 9, color: Colors.white),
                              child: Icon(
                                Icons.bookmark_border_rounded,
                                color: Colours.primaryColor,
                                size: 18,
                              ))
                        ],
                      ),SizedBox(
                        height: 6,
                      ),
                      Container(height: 2,color: Colours.shadeColor,),
                      Expanded(
                        child: new ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Job Description',
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colours.primaryColor,
                                  fontWeight: FontWeight.w800),
                            ), SizedBox(
                              height: 6,
                            ),
                            Container(height: 2,color: Colours.shadeColor,),
                            Html(
                                data: data.description,
                                shrinkWrap: true,
                                onLinkTap: (url) {
                                  // open url in a webview
                                  _launchURL(url);
                                }),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'How to Apply',
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colours.primaryColor,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(height: 2,color: Colours.shadeColor,),
                            Html(
                                data: data.howToApply,
                                shrinkWrap: true,
                                onLinkTap: (url) {
                                  // open url in a webview
                                  _launchURL(url);
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    ));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
