import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listCard = [
    {
      "id": 1,
      "image":
          "https://i.pinimg.com/236x/53/92/bc/5392bc7bf2090bb90bbd118558568fa6.jpg",
    },
    {
      "id": 1,
      "image":
          "https://i.pinimg.com/236x/53/92/bc/5392bc7bf2090bb90bbd118558568fa6.jpg",
    },
    {
      "id": 2,
      "image":
          "https://i.pinimg.com/236x/9c/b6/47/9cb647e78397244cfee063460aa3abaa--naruto-shippiden-naruto-fan-art.jpg",
    },
    {
      "id": 2,
      "image":
          "https://i.pinimg.com/236x/9c/b6/47/9cb647e78397244cfee063460aa3abaa--naruto-shippiden-naruto-fan-art.jpg",
    },
    {
      "id": 3,
      "image":
          "https://i.pinimg.com/236x/11/32/32/1132329458a776829273a21e94138f49--art-is-walks.jpg",
    },
    {
      "id": 3,
      "image":
          "https://i.pinimg.com/236x/11/32/32/1132329458a776829273a21e94138f49--art-is-walks.jpg",
    },
    {
      "id": 4,
      "image":
          "https://www.pixelstalk.net/wp-content/uploads/images4/Naruto-Shippuden-Phone-Wallpaper-1-349x620.jpg",
    },
    {
      "id": 4,
      "image":
          "https://www.pixelstalk.net/wp-content/uploads/images4/Naruto-Shippuden-Phone-Wallpaper-1-349x620.jpg",
    },
    {
      "id": 5,
      "image":
          "https://www.pixelstalk.net/wp-content/uploads/images4/Naruto-Shippuden-Phone-Wallpaper-3-349x620.jpg",
    },
    {
      "id": 5,
      "image":
          "https://www.pixelstalk.net/wp-content/uploads/images4/Naruto-Shippuden-Phone-Wallpaper-3-349x620.jpg",
    },
    {
      "id": 6,
      "image":
          "https://www.pixelstalk.net/wp-content/uploads/images4/Naruto-Shippuden-Phone-Wallpaper-4-349x620.jpg",
    },
    {
      "id": 6,
      "image":
          "https://www.pixelstalk.net/wp-content/uploads/images4/Naruto-Shippuden-Phone-Wallpaper-4-349x620.jpg",
    },
  ]..shuffle();

  var listSelectedIndex = [];
  var listChoosenIndex = [];

  Timer? timerPlay;
  Timer? timerAlgo;
  var indexAuto = 0;
  var second = 00;
  var minute = 00;
  var listSelectedByAi = [];
  var isAlgorithRun = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Game"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.yellowAccent,
                  ),
                  child: Text(
                    "$minute : $second",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: listCard.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            if (timerPlay == null || !timerPlay!.isActive) {
                              timerPlay =
                                  Timer.periodic(Duration(seconds: 1), (timer) {
                                if (second < 59) {
                                  setState(() {
                                    second = second + 1;
                                  });
                                } else {
                                  setState(() {
                                    second = 0;
                                    minute = minute + 1;
                                  });
                                }
                              });
                            }
                            if (!listChoosenIndex.contains(index)) {
                              if (!listSelectedIndex.contains(index) &&
                                  listSelectedIndex.length < 2) {
                                setState(() {
                                  listSelectedIndex.add(index);
                                });
                              }
                              if (listSelectedIndex.length == 2) {
                                print(listCard[listSelectedIndex[0]]['id']);
                                print(listCard[listSelectedIndex[1]]['id']);
                                if (listCard[listSelectedIndex[0]]['id'] ==
                                    listCard[listSelectedIndex[1]]['id']) {
                                  setState(() {
                                    listChoosenIndex.add(listSelectedIndex[0]);
                                    listChoosenIndex.add(listSelectedIndex[1]);
                                    listSelectedIndex.clear();
                                  });
                                } else {
                                  Timer(Duration(seconds: 1), () {
                                    setState(() {
                                      listSelectedIndex.clear();
                                    });
                                  });
                                }
                              }
                              print(listSelectedIndex);
                            }
                            if (listChoosenIndex.length == 12) {
                              timerPlay!.cancel();
                            }
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.green,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    listCard[index]["image"].toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: listSelectedIndex.contains(index) ||
                                        listChoosenIndex.contains(index)
                                    ? 0
                                    : null,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (timerPlay == null || !timerPlay!.isActive) {
                            timerPlay =
                                Timer.periodic(Duration(seconds: 1), (timer) {
                              if (second < 59) {
                                setState(() {
                                  second = second + 1;
                                });
                              } else {
                                setState(() {
                                  second = 0;
                                  minute = minute + 1;
                                });
                              }
                            });
                          }
                        },
                        child: Text("Start"),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(15.0),
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       timerPlay!.cancel();
                    //     },
                    //     child: Text("Pause"),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          reset();
                        },
                        child: Text("Reset"),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!isAlgorithRun) myAlgorithm();
                    },
                    child: Text("Run My Algorithm"),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: listChoosenIndex.length == 12,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(
                      10,
                    ),
                    child: Text("$minute : $second"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        reset();
                      },
                      child: Text("Main Lagi"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  reset() {
    setState(() {
      minute = 00;
      second = 00;
      indexAuto = 0;
      listSelectedIndex.clear();
      listChoosenIndex.clear();
      listSelectedByAi.clear();
      if (timerPlay != null) {
        timerPlay!.cancel();
      }
      if (timerAlgo != null) {
        timerAlgo!.cancel();
      }
    });
  }

  myAlgorithm() async {
    setState(() {
      isAlgorithRun = true;
    });
    reset();
    if (timerPlay == null || !timerPlay!.isActive) {
      timerPlay = Timer.periodic(Duration(seconds: 1), (timer) {
        if (second < 59) {
          setState(() {
            second = second + 1;
          });
        } else {
          setState(() {
            second = 0;
            minute = minute + 1;
          });
        }
      });
    }
    timerAlgo = Timer.periodic(Duration(milliseconds: 500), (timer) {
      // if (timer.tick % 2 == 0) {
      if (!listSelectedByAi.contains(listCard[indexAuto]["id"])) {
        setState(() {
          listSelectedByAi.add(listCard[indexAuto]["id"]);
        });
      } else {
        setState(() {
          listSelectedByAi.add(listCard[indexAuto]["id"]);
          listChoosenIndex.add(indexAuto);
          listChoosenIndex
              .add(listSelectedByAi.indexOf(listCard[indexAuto]["id"]));
        });
      }
      setState(() {
        listSelectedIndex.clear();
        listSelectedIndex.add(indexAuto);
        indexAuto = indexAuto + 1;
        if (indexAuto == listCard.length) {
          timerAlgo!.cancel();
        }
      });
      print(listSelectedByAi);
      if (listChoosenIndex.length == 12) {
        timerPlay!.cancel();
        setState(() {
          isAlgorithRun = false;
        });
      }
    });
  }
}
