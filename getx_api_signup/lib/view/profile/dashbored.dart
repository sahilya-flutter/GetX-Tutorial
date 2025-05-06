import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_signup/auth/api_service.dart';
import 'package:getx_api_signup/contoller/login_contoller.dart';
import 'package:getx_api_signup/view/profile/profile_page.dart';
import 'package:getx_api_signup/view/profile/user_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  final LoginController controller = Get.find();
  bool isLoading = true;
  Map userProfile = {};
  int _selectedIndex = 0;
  late AnimationController _animationController;
  final iconList = [Icons.people, Icons.person];

  @override
  void initState() {
    super.initState();
    loadUserProfile();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future loadUserProfile() async {
    try {
      final result = await ApiService.getUserProfile(controller.token.value);
      setState(() {
        isLoading = false;
        if (result['statusCode'] == 200) {
          userProfile = result['body']['data'];
        }
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Get.snackbar(
        "Error",
        "Failed to load user profile",
        backgroundColor: const Color.fromRGBO(255, 0, 0, 0.3),
        colorText: Colors.white,
      );
    }
  }

  Widget get _bodyContent {
    return _selectedIndex == 0
        ? const UserPage()
        : ProfilePage(userProfile: userProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'User' : 'Profile',style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _bodyContent,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.black : Colors.grey;
          final label = index == 0 ? 'User' : 'Profile';

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconList[index], size: 24, color: color),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(color: color, fontSize: 12)),
            ],
          );
        },
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.none, // 🔽 no center FAB gap
        notchSmoothness: NotchSmoothness.defaultEdge,
        backgroundColor: Colors.white,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
