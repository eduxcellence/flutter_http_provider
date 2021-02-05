import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_http_provider/constant/constants.dart';
import 'package:flutter_http_provider/model/jobs_model.dart';
import 'package:http/http.dart' as http;

class JobProvider extends ChangeNotifier
{
  List<JobsModel> jobsListing=[];
  bool isLoading=true;


  setLoading(bool status)
  {
    isLoading=status;

  }

  Future<List<JobsModel>> fetchJobListing()
  async {
    setLoading(true);
    jobsListing =[];

    var data = await http.get(Constants.jobFetchUrl);
    var  mapData= jsonDecode(data.body);
if(data.statusCode==200)
  {
    for(Map i in mapData){
      jobsListing.add(JobsModel.fromJson(i));
    }
  }

    print(jobsListing);
    return jobsListing;

  }

  setData(List<JobsModel> jobsList) {

    this.jobsListing=jobsList;
    setLoading(false);

    notifyListeners();

  }

  String _searchString = "";

  UnmodifiableListView<JobsModel> get jobsModel => _searchString.isEmpty
      ? UnmodifiableListView(jobsListing)
      : UnmodifiableListView(
      jobsListing.where((jobsModel) => jobsModel.title.toLowerCase().trim().contains(_searchString.toLowerCase().trim())));

  void changeSearchString(String searchString) {
    _searchString = searchString;
    print(_searchString);
    notifyListeners();
  }


}