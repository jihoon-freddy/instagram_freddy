import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Container(color: Colors.primaries[0],),
    Container(color: Colors.primaries[1],),
    Container(color: Colors.primaries[2],),
    Container(color: Colors.primaries[3],),
    Container(color: Colors.primaries[4],),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('20억짜리 앱'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,    // 65라인 BottomNavigationBarItem 에서 Text 공백 넣은것 때문에 공백이 생긴 layout 정렬을 해주는 기능(공백영역 제거)
        showUnselectedLabels: false,  // 65라인 BottomNavigationBarItem 에서 Text 공백 넣은것 때문에 공백이 생긴 layout 정렬을 해주는 기능(공백영역 제거)
        unselectedItemColor: Colors.grey[900],  // 선택이 안된 BottomNavigationBarItem 색깔 - 회색
        selectedItemColor: Colors.black,        // 선택이 된 BottomNavigationBarItem 색깔 - 검정
        type: BottomNavigationBarType.shifting,    // fixed => shifting 으로 하면 BottomNavigationBarItem 바뀔 때 마다 영역의 약간의 애니메이션 효과
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        items: [
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/home_selected.png",   // activeIconPath => 선택 된 icon path
              iconPath: "assets/home.png"),                 // iconPath => 선택 되지 않은 icon path
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/search_selected.png",
              iconPath: "assets/search.png"),
          _buildBottomNavigationBarItem(iconPath: "assets/add.png"),  // 해당 화면에서 카메라 앱을 보여지는게 아니라 다른 화면 나타나면서 카메라 앱이 보여 지므로 iconPath 만 설정 함
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/heart_selected.png",
              iconPath: "assets/heart.png"),
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/profile_selected.png",
              iconPath: "assets/profile.png"),


        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index), // bottomItemBar 의 tap 왼쪽부터 오른쪽으로 0,1,2,3 ~ 이렇게 index 가 된다.
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {String activeIconPath, String iconPath}) {
    return BottomNavigationBarItem(
      activeIcon: activeIconPath == null ? null : ImageIcon(    // activeIcon => 선택 된 icon
          AssetImage(activeIconPath)),
      icon: ImageIcon(AssetImage(iconPath)),                    // icon => 선택 되지 않은 icon
      title: Text(''),                                          // 앱에서 사용하지 않지만 title 이 필수 속성이다. 그래서 Text 위젯 공백으로 처리
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}