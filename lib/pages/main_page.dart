import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../utils/utils.dart';

final StateProvider<bool> showBalance = StateProvider((ref) => true);
final StateProvider<String> userBalance = StateProvider((ref) => "₦ 50,000,620.00");
final  StateProvider<String> hiddenUserBalance = StateProvider((ref) => "₦ *************");
final  StateProvider<int> activeBottomNavTab = StateProvider((ref) => 0);


class PageEsan extends ConsumerWidget {
  const PageEsan({Key? key}) : super(key: key);


  // final String nairaSign = "₦";
  String balanceHasher(String accountBalance){
    return "";
  }

  // demoBalanceHasher(String accountBalance){
  //   if(showBalance == true){
  //     // showBalance = false;
  //     print("Condition set to false");
  //     // return userBalance;
  //   }
  //   else if(showBalance == false){
  //     // showBalance= true;
  //     print("Condition set to true");
  //     // return hiddenUserBalance;
  //   }
  //   // return "";
  //   // throw("");
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isVisible = ref.watch(showBalance);
    // String userBalance = "$nairaSign 50,000,620.00";
    // String hiddenUserBalance = "$nairaSign *************";
    const double bottomAppBarHeight = 50.0;

    final List<IconData> visibilityIcon = [
      CupertinoIcons.eye_slash_fill,
      CupertinoIcons.eye_solid
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomAppBarTheme: const BottomAppBarTheme(
          elevation: 100.0
        ),

      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF000133),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - bottomAppBarHeight,
              maxHeight: MediaQuery.of(context).size.height - bottomAppBarHeight
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "esan...",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30.0
                        ),
                      )
                    ],
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    // vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Your Balance",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          if(isVisible == true){
                            ref.read(showBalance.notifier).state = false;
                          }
                          else if(isVisible == false){
                            ref.read(showBalance.notifier).state = true;
                          }
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.white
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Icon(
                                  isVisible == true ? 
                                    visibilityIcon[0] : 
                                    visibilityIcon[1],
                                  size: 16.0,
                                  color: Colors.white
                                ),
              
                                const SizedBox(width: 10.0),
              
                                Text(
                                  isVisible ? "  hide" : "show",
                                  style: const TextStyle(
                                    color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const  EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      isVisible == true ? 
                        ref.read(userBalance.notifier).state :
                        ref.read(hiddenUserBalance.notifier).state,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  indent: 16.0,
                  endIndent: 16.0,
                  height: 0.0,
                  thickness: 1.0,
                  color: Colors.white30
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 20.0),
                  child: Row(
                    children: [
                      const Text(
                        "Account Number: ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "110073383",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      GestureDetector(
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // title: Text(""),
                              content: const Text(
                                "Copied to clipboard"
                              ),
                              actions: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Text(
                                    "OK"
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                        child: const Icon(
                          Icons.copy, size: 16.0, color: Colors.redAccent,
                        )
                      )
                    ],
                  ),
                ),

                // Curved white box starts
                Expanded(
                  child: Container(
                    // height: 100.0,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 0.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 253, 249, 249),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome back John",
                          style: TextStyle(
                            color: Colors.black45
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 16.0),
                          child: Text(
                            "What would you like to do?",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Expanded(
                          // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
                          child: Container(
                            // padding:  const EdgeInsets.symmetric(horizontal: 0.0),
                            // color: Colors.green,
                            // height: 290.0,
                            child: GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              childAspectRatio: 1.25,
                              children: [
                                ActionGridCard(
                                  icon: CupertinoIcons.money_pound,
                                  text: "Fund Wallet",
                                  iconColor: Colors.green[800],
                                ),ActionGridCard(
                                  icon: CupertinoIcons.money_pound,
                                  text: "Fund Wallet",
                                  iconColor: Colors.yellow[800],
                                ),ActionGridCard(
                                  icon: CupertinoIcons.money_pound,
                                  text: "Fund Wallet",
                                  iconColor: Colors.red[800],
                                ),ActionGridCard(
                                  icon: CupertinoIcons.money_pound,
                                  text: "Fund Wallet",
                                  iconColor: Colors.blue[800],
                                ),ActionGridCard(
                                  icon: CupertinoIcons.money_pound,
                                  text: "Fund Wallet",
                                  iconColor: Colors.green[800],
                                ),ActionGridCard(
                                  icon: CupertinoIcons.money_pound,
                                  text: "Fund Wallet",
                                  iconColor: Colors.yellow[800],
                                ),ActionGridCard(
                                  icon: CupertinoIcons.money_pound,
                                  text: "Fund Wallet",
                                  iconColor: Colors.red[800],
                                ),ActionGridCard(
                                  icon: CupertinoIcons.money_pound,
                                  text: "Fund Wallet",
                                  iconColor: Colors.blue[800],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    
    
    
        bottomNavigationBar: ColoredBox(
          color: const Color.fromARGB(255, 253, 249, 249),
          // color: Colors.transparent,
          child: BottomAppBar(
            // notchMargin: ,
            // notchedShape: ,
            // color: Colors.red,
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: bottomAppBarHeight,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                // color: Color(0xFFFFFFFF)
                color: Colors.transparent
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(ref.read(activeBottomNavTab.notifier).state !=0){
                        ref.read(activeBottomNavTab.notifier).state = 0;
                      }
                    },
                    child: Icon(
                      CupertinoIcons.house_fill,
                      color: ref.watch(activeBottomNavTab) == 0 ? const Color(0xFF000133) : Colors.grey,
                    )
                  ),
                  const SizedBox(width: 16.0,),
                  GestureDetector(
                    onTap: (){
                      if(ref.read(activeBottomNavTab.notifier).state != 1){
                        ref.read(activeBottomNavTab.notifier).state = 1;
                      }
                    },
                    child: Icon(
                      CupertinoIcons.person_crop_square_fill,
                      color: ref.watch(activeBottomNavTab) == 1 ? const Color(0xFF000133) : Colors.grey,
                    )
                  ),
                ]
              ),
            ),
          ),
        ),
    
        floatingActionButton: FloatingActionButton(
          // mini: false,
          clipBehavior: Clip.hardEdge,
          backgroundColor: const Color.fromARGB(255, 247, 170, 5),
          onPressed: (() => ""),
          child: const Padding(
            padding: EdgeInsets.only(left: 5.0, top: 3.0),
            child: Icon(
              Icons.send_rounded, color: Colors.white,  size: 30.0,
            )
          ),
        ),
    
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}













class ActionGridCard extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color? iconColor;
  
  const ActionGridCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFDDDDDD),
            blurRadius: 6.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 0.0)
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: iconColor!.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: Icon(icon, color: iconColor, size: 18.0,),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}