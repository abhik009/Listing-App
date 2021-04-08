import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listing_app/ListItem.dart';
import 'package:listing_app/data_model.dart';
import 'package:listing_app/services.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Listing App',
    theme: ThemeData(primarySwatch: Colors.amber, accentColor: Colors.green),
    debugShowCheckedModeBanner: false,
    home: MemberListing(),
  ));
}

class MemberListing extends StatefulWidget {
  @override
  _MemberListingState createState() => _MemberListingState();
}

class _MemberListingState extends State<MemberListing> {
  //Lists to feed the data into ListView.
  List<MemberModel> memberList, searchList;
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // Function to initialize fetching of online data using http.
  Future<void> getData() async {
    isLoading = true;
    Services.getMembers().then((members) => {
          setState(() {
            memberList = members; // just to make data accessible globaly
            searchList =
                memberList; // using search list as common list for both fetched and filtered data List.
            isLoading = true;
          })
        });
  }

  // function to handle the filtering of data.
  void search(String value) {
    List<MemberModel> results = [];
    if (value.trim().isEmpty) {
      results = memberList;
    } else {
      results = memberList
          .where((memObj) => memObj.memberName
              .toLowerCase()
              .contains(value.trim().toLowerCase()))
          .toList();
    }
    setState(() {
      searchList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Showing Loading text till data is being fetched from server
        title: Text(isLoading ? "Loading..." : "Members List load",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'comforta')),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Card(
            elevation: 4.0,
            margin: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 2),
            child: TextField(
              onChanged: (value) => search(value),
              // used input decorater for capturing user text and used s
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Search',
                  labelStyle: TextStyle(fontFamily: 'comforta'),
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: getData,
              child: ListView.builder(
                  itemCount: null == searchList ? 0 : searchList.length,
                  itemBuilder: (context, index) {
                    MemberModel member = searchList[index];
                    return ListItem(
                      onClick: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Clicked on:' + member.id.toString())));
                      },
                      color: Colors.amber,
                      id: member.id.toString(),
                      name: member.memberName,
                      category: member.category
                          .toString()
                          .replaceAll("Category.", ""),
                      shgID: member.shgId.toString(),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
