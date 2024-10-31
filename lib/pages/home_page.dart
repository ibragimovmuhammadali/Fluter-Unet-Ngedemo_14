 import 'package:flutter/material.dart';
 import 'package:http/http.dart' as http;
import 'package:ngedemo_14_1/model/post_model.dart';
import 'package:ngedemo_14_1/service/http_service.dart';

import '../service/log_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  apiLoadPostList() async{
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);
  }

  apiLoadPostList2() async{
    var reponse = await HttpService.GET(HttpService.API_POST_LIST, HttpService.paramsEmpty());
    LogService.i(reponse!);
  }

  apiLoadPostList3() async{
    Post post = Post(title: "NextGen", body: "Academy", userId: 1);
    var reponse = await HttpService.POST(HttpService.API_POST_CREATE, HttpService.paramsCreatPost(post));
    LogService.e(reponse!);
  }

  apiLoadPostList4() async{
    Post post = Post(id: 1,title: "NextGen", body: "Academy", userId: 1);

    var reponse = await HttpService.PUT(HttpService.API_POST_UPDATE+post.id.toString(), HttpService.paramsUpdaetPost(post));
    LogService.i(reponse!);
  }

  apiLoadPostList5() async{
    Post post = Post(id: 1,title: "NextGen", body: "Academy", userId: 1);

    var reponse = await HttpService.DEL(HttpService.API_POST_DELETE+post.id.toString(), HttpService.paramsEmpty());
    LogService.d(reponse!);
  }

  @override
  void initState() {
    super.initState();
    apiLoadPostList2();
    apiLoadPostList3();
    apiLoadPostList();
    apiLoadPostList4();
    apiLoadPostList5();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
