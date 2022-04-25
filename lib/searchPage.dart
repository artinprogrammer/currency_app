import 'package:cryptocurrency/Model/Currency.dart';
import 'package:cryptocurrency/mainPage.dart';
import 'package:cryptocurrency/seeDetailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class searchState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Search();
}

class Search extends State<searchState> {
  List mainList = [];
  List searchedList = [];
  var jsonList;
  Future getSearchedJson() async {
    var url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";
    var response = await http.get(Uri.parse(url));
    jsonList = jsonDecode(response.body);
    if (mainList.isEmpty) {
      for (var i = 0; i < jsonList.length; i++) {
        setState(() {
          mainList.add(Currency(
              id: jsonList[i]["id"],
              symbol: jsonList[i]["symbol"],
              name: jsonList[i]["name"],
              image: jsonList[i]["image"],
              current_price: jsonList[i]["current_price"],
              marketCap: jsonList[i]["marketCap"],
              market_cap_rank: jsonList[i]["market_cap_rank"],
              fullyDilutedValuation: jsonList[i]["fullyDilutedValuation"],
              totalVolume: jsonList[i]["totalVolume"],
              high_24h: jsonList[i]["high_24h"],
              low_24h: jsonList[i]["low_24h"],
              price_change_24h: jsonList[i]["price_change_24h"],
              price_change_percentage_24h: jsonList[i]["price_change_percentage_24h"],
              marketCapChange24H: jsonList[i]["marketCapChange24H"],
              marketCapChangePercentage24H: jsonList[i]
                  ["marketCapChangePercentage24H"],
              circulatingSupply: jsonList[i]["circulatingSupply"],
              totalSupply: jsonList[i]["totalSupply"],
              maxSupply: jsonList[i]["maxSupply"],
              ath: jsonList[i]["ath"],
              athChangePercentage: jsonList[i]["athChangePercentage"],
              athDate: jsonList[i]["athDate"],
              atl: jsonList[i]["atl"],
              atlChangePercentage: jsonList[i]["atlChangePercentage"],
              atlDate: jsonList[i]["atlDate"],
              roi: jsonList[i]["roi"],
              last_updated: jsonList[i]["lastUpdated"]));
        });
      }
      // mainList = jsonList;
    }
    // print(mainList[0].current_price);
  }

  // void _getSearchedList(String query) {
  //   searchedList = mainList.where((obj) {
  //     var name = obj.name?.toLowerCase();
  //     return name!.contains(query);
  //   }).toList();
  // }

  @override
  void initState() {
    searchedList = mainList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getSearchedJson();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: TextButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainPage()));
                          },
                          icon: Icon(
                            CupertinoIcons.back,
                            color: Colors.black,
                            size: 25,
                          ),
                          label: Text("")),
                    ),
                  ),
                  // searchfield
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Container(
                      width: 300,
                      height: 50,
                      child: TextField(
                        onChanged: (text) async {
                          setState(() {
                            text = text.toLowerCase();
                            searchedList = mainList.where((currency) {
                              var name = currency.name.toString().toLowerCase();
                              return name.contains(text);
                            }).toList();
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: "search",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          prefixIcon: Icon(CupertinoIcons.search),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.5,
                // color: Colors.red,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: searchedList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(3, 15, 3, 0),
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Image.network(searchedList[index].image.toString(),
                                  width: 40),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        searchedList[index].name.toString(),
                                        style: TextStyle(fontSize: 17),
                                      ))),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        searchedList[index]
                                                .current_price
                                                .toString() +
                                            "\$",
                                        style: TextStyle(fontSize: 17),
                                      ))),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => seeDetails(currencyList: searchedList,index: index,)));
                                          },
                                          child: Text(
                                            "see details",
                                            style: TextStyle(fontSize: 17),
                                          )))),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
