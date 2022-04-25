import 'package:cryptocurrency/searchPage.dart';
import 'package:cryptocurrency/seeDetailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Model/Currency.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}

List mainList = [];
var jsonList;

class _MainPage extends State<MainPage> {
  Future getResponse() async {
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
              price_change_percentage_24h: jsonList[i]
                  ["price_change_percentage_24h"],
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
    return mainList;
  }

  @override
  Widget build(BuildContext context) {
    getResponse();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Cryptocurrency",
                          style: TextStyle(fontSize: 23),
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(100, 15, 0, 0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => searchState()));
                          },
                          icon: const Icon(
                            CupertinoIcons.search,
                            color: Colors.black,
                            size: 30,
                          ),
                          label: const Text("")),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 10, 3, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "coin",
                                    style: TextStyle(fontSize: 22),
                                  ))),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "price",
                                    style: TextStyle(fontSize: 22),
                                  ))),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "details",
                                    style: TextStyle(fontSize: 22),
                                  ))),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 400, child: listFutureBuilder()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<dynamic> listFutureBuilder() {
    return FutureBuilder(
      future: getResponse(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                return Item(
                  list: snapshot.data,
                  index: index,
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class Item extends StatelessWidget {
  List? list;
  int? index;
  Item({this.list, this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 15, 3, 0),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(const Radius.circular(25))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 10,
            ),
            Image.network(list![index!].image, width: 40),
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      list![index!].name.toString(),
                      style: const TextStyle(fontSize: 17),
                    ))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      list![index!].current_price.toString() + "\$",
                      style: const TextStyle(fontSize: 17),
                    ))),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => seeDetails(
                                    currencyList: mainList,
                                    index: index,
                                  )));
                        },
                        child: const Text(
                          "see details",
                          style: const TextStyle(fontSize: 17),
                        )))),
          ],
        ),
      ),
    );
  }
}
