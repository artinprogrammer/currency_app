import 'package:cryptocurrency/mainPage.dart';
import 'package:cryptocurrency/searchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class seeDetails extends StatelessWidget {
  List? currencyList;
  int? index;
  seeDetails({this.currencyList, this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    icon: const Icon(
                      CupertinoIcons.back,
                      size: 30,
                      color: Colors.black,
                    ),
                    label: const Text("")),
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => searchState()));
                    },
                    icon: const Icon(
                      CupertinoIcons.search,
                      size: 30,
                      color: Colors.black,
                    ),
                    label: const Text("")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                    child: Row(
                      children: [
                        Image.network(
                          currencyList![index!].image,
                          width: 50,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(currencyList![index!].symbol.toUpperCase(),
                              style: const TextStyle(fontSize: 20)),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            currencyList![index!].name,
                            style: const TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text("Rank ${currencyList![index!].market_cap_rank}",
                              style: const TextStyle(fontSize: 20)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "price change in 24 hours: ${currencyList![index!].price_change_24h.toStringAsFixed(2)}\$",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "price percentage change: ${currencyList![index!].price_change_percentage_24h.toStringAsFixed(2)}%",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "highest price in 24 hours: ${currencyList![index!].high_24h.toStringAsFixed(2)}\$",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "lowest price in 24 hours: ${currencyList![index!].low_24h.toStringAsFixed(2)}\$",
                              style: const TextStyle(fontSize: 20),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: Text(
              currencyList![index!].current_price.toString() + "\$",
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ],
      )),
    );
  }
}
