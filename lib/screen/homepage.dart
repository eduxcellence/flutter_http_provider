import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_provider/background/background.dart';
import 'package:flutter_http_provider/constant/colors.dart';
import 'package:flutter_http_provider/constant/constants.dart';
import 'package:flutter_http_provider/model/jobs_model.dart';
import 'package:flutter_http_provider/provider/jobprovider.dart';
import 'package:flutter_http_provider/screen/detailscreen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  fetchData() async {
    final _provider = Provider.of<JobProvider>(context, listen: false);
    List<JobsModel> jobList = await _provider.fetchJobListing();
    _provider.setData(jobList);
  }
var _searchController=new TextEditingController();
  String _searchText;

  @override
  void initState() {
    _searchController.addListener(
          () {
       /* setState(() {
          _searchText = _searchController.text;
        });*/
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Consumer<JobProvider>(
            builder: (context, jobsList, child) => Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    leading: Icon(
                      Icons.menu,
                      color: Colours.shadeColor,
                      size: 20,
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.notifications_active_rounded,
                          color: Colours.shadeColor,
                          size: 20,
                        ),
                      )
                    ],
                    backgroundColor: Colours.primaryColor,
                  ),
                  body: Container(
                    color: Colours.primaryColor,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 1, left: 5, right: 5, bottom: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45),
                                bottomLeft: Radius.circular(45),
                                bottomRight: Radius.circular(45))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 12, right: 12, top: 8, bottom: 12),
                              child: searchWidget(),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            jobListWidget()
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }

  searchWidget() {
    return TextField(controller: _searchController,keyboardType: TextInputType.name,autofocus: false,focusNode: FocusScopeNode(),
      cursorColor: Colours.searchTextColor,
      decoration: new InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 25,
            color: Colours.primaryColor,
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              const Radius.circular(55.0),
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(10),
          hintStyle: new TextStyle(color: Colours.searchTextColor),
          labelStyle: new TextStyle(color: Colours.primaryColor),
          hintText: Constants.hintSearchJob,
          fillColor: Colours.shadeColor),  onChanged: (value) {
        Provider.of<JobProvider>(context, listen: false)
            .changeSearchString(value);
      },
    );
  }

  jobListWidget() {
    return FutureProvider(
      create: (_) async => await fetchData(),
      lazy: false,
      child: Provider.of<JobProvider>(context).isLoading
          ? CircularProgressIndicator()
          : Expanded(
              child: ListView.builder(
              itemBuilder: _itemJob,
              itemCount: Provider.of<JobProvider>(context).jobsModel.length,
              shrinkWrap: true,
              cacheExtent: 9999,
              physics: ScrollPhysics(),
            )),
    );
  }

  Widget _itemJob(BuildContext context, int index) {
    JobsModel data =
        Provider.of<JobProvider>(context, listen: false).jobsModel[index];
    return Hero(
        tag: data.id,
        child: Material(
          type: MaterialType.transparency,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JobDetail(data)));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colours.itemBgColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
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
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    data.title.split("(").first,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data.company,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colours.searchTextColor,
                                      fontWeight: FontWeight.w200),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  data.companyUrl ?? "",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colours.itemLightTextColor,
                                      fontWeight: FontWeight.w200),
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'l.p.a*',
                                  style: TextStyle(
                                      fontSize: 7,
                                      color: Colours.shadeColor,
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
                                color: Colours.itemComLogoColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            textStyle: TextStyle(
                                fontSize: 9, color: Colours.primaryColor),
                            child: Icon(
                              Icons.bookmark_border_rounded,
                              color: Colours.shadeColor,
                              size: 18,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
