import 'dart:math';
import 'package:english_project/components/card_item.dart';
import 'package:english_project/components/indicator.dart';
import 'package:english_project/pages/control_page.dart';
import 'package:english_project/utils/app_styles.dart';
import 'package:english_project/utils/app_theme.dart';
import 'package:english_project/utils/constants.dart';
import 'package:english_project/utils/shared_keys.dart';
import 'package:english_project/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(
    viewportFraction: 1.1,
  );

  int _currentPage = 0;

  List<int> getListNouns({int len = 1, int max = 120}) {
    List<int> newList = [];

    if (len <= 0 || len > max) return newList;

    Random random = Random();
    int count = 0;
    while (count < len) {
      int val = random.nextInt(max);
      if (newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }
    return newList;
  }

  List<String> listWords = [];

  void getEnglishWords() async {
    final prefs = await SharedPreferences.getInstance();
    final int value = prefs.getInt(SharedKeys.counter) ?? 5;
    List<String> newList = [];

    List<int> listWordsIndex = getListNouns(len: value, max: nouns.length);

    listWordsIndex.forEach((element) {
      newList.add(nouns[element]);
    });

    setState(() {
      listWords = newList;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getEnglishWords();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.kBlueGrey,
      appBar: AppBar(
        title: Text(
          "English today",
          style: AppStyles.h3.copyWith(
            fontSize: 36,
            color: AppColors.kBlackGrey,
          ),
        ),
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            size: 40,
            color: AppColors.kBlackGrey,
          ),
        ),
        backgroundColor: AppColors.kBlueGrey,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: size.height * 1 / 10,
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "It's amazing how complete is the delusion that beauty is goodness.",
              style: AppStyles.h5.copyWith(
                color: AppColors.kBlackGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: size.height * 0.6,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ScrollConfiguration(
              behavior: MouseDraggableScrollBehavior(),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: listWords.length > 5 ? 6 : listWords.length,
                itemBuilder: (context, index) {
                  String firstLetter = listWords[index].substring(0, 1);
                  String rightLetter =
                      listWords[index].substring(1, listWords[index].length);
                  return FractionallySizedBox(
                    widthFactor: 1 / _pageController.viewportFraction,
                    child: index >= 5
                        ? Container(
                            decoration: const BoxDecoration(
                              color: AppColors.kBlueBold,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Show more...",
                                style: AppStyles.h3,
                              ),
                            ),
                          )
                        : CardItem(
                            size: size,
                            firstLetter: firstLetter,
                            rightLetter: rightLetter,
                          ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              child: ScrollConfiguration(
                behavior: MouseDraggableScrollBehavior(),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listWords.length > 5 ? 5 : listWords.length,
                  itemBuilder: (context, index) {
                    return Indicator(isActive: index == _currentPage);
                  },
                ),
              ),
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getEnglishWords();
          });
        },
        child: const Icon(
          Icons.ads_click_sharp,
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your mind",
                style: AppStyles.h3.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                label: "Favorites",
                onTap: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                label: "Your control",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ControlPage(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
