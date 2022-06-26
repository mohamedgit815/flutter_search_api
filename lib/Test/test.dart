import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;


class TestScreen extends ConsumerStatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends ConsumerState<TestScreen> {
  late List<TestModel> _dataSearch;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: (){
            showSearch(context: context, delegate: TestSearch(_dataSearch));
          },
        ),
      ),

      body: Column(
        children: [
          Expanded(
              child: ref.watch(_fetchData).when(
                  error: (err,stack)=> Center(child: Text(err.toString())),
                  loading: ()=> const Center(child: CircularProgressIndicator.adaptive()),
                data: (data)=> ListView.builder(
                    itemCount: data.length ,
                    itemBuilder: (context,i){
                      _dataSearch = data;
                      return ListTile(
                        title: Text(data.elementAt(i).title.toString()),
                        subtitle: Text(data.elementAt(i).body.toString()),
                      );
                    })
              )
          )
        ],
      )

    );
  }
}

final _fetchData = FutureProvider((ref)=>TestModel.fetchData());

class TestSearch extends SearchDelegate {
  final List<TestModel> dataSearch;
   TestSearch(this.dataSearch);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, 0);
    }, icon: Icon(Icons.adaptive.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Bing');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<TestModel> _searchData = dataSearch.where((element){
      return element.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
        itemCount: query.isNotEmpty ? _searchData.length :  dataSearch.length,
        itemBuilder: (context,i) {
          final TestModel _data = dataSearch.elementAt(i);
          final TestModel _search = _searchData.elementAt(i);

          return ListTile(
            title: query.isNotEmpty ? Text(_search.title.toString()) :Text(_data.title.toString()),
            subtitle: query.isNotEmpty ? Text(_search.body.toString()) : Text(_data.body.toString()),
          );
        });
  }
}

class TestModel{
  final String title,body;
  const TestModel({required this.title, required this.body});

  factory TestModel.fromApp( Map<String,dynamic>map ){
    return TestModel(
        title: map['title'] ,
        body: map['body']
    );
  }

 static Future<List<TestModel>> fetchData() async {
    final http.Response _response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final List<dynamic> _body = jsonDecode(_response.body);
    if(_response.statusCode == 200) {
      final List<TestModel> _data = _body.map((e) => TestModel.fromApp(e))
          .toList();
      return _data;
    }
    return fetchData();
  }
}