import 'package:flutter/material.dart';

import '../features/home/presentation/screens/home_screen.dart';
import '../features/history/presentation/screens/history_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int _currentIndex = 0;

  static const _screens = [
    HomeScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  final List<String> _titles = [
    "Health Dashboard",
    "Medical History",
    "Patient Profile",
  ];

  // ================= HEALTH RELATED IMAGES =================
  final List<String> _headerImages = [
    // Virus / medical
    "https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?q=80&w=1200&auto=format&fit=crop",

    // Person with headache
    "https://images.unsplash.com/photo-1604881991720-f91add269bed?q=80&w=1200&auto=format&fit=crop",

    // Doctor / healthcare
    "https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?q=80&w=1200&auto=format&fit=crop",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FB),

      body: Column(
        children: [
          // ================= MODERN HEALTH HEADER =================
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(34),
                bottomRight: Radius.circular(34),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  _headerImages[_currentIndex],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(34),
                  bottomRight: Radius.circular(34),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.25),
                    Colors.black.withOpacity(0.75),
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      // ================= TOP BAR =================
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          // Health App Logo
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color:
                                  Colors.white.withOpacity(0.15),
                              borderRadius:
                                  BorderRadius.circular(18),
                              border: Border.all(
                                color: Colors.white24,
                              ),
                            ),
                            child: const Icon(
                              Icons.health_and_safety_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),

                          // Professional Avatar
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(
                                "https://i.pravatar.cc/300",
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // ================= TITLE =================
                      Text(
                        _titles[_currentIndex],
                        style:
                            theme.textTheme.headlineMedium
                                ?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "AI-powered healthcare experience",
                        style:
                            theme.textTheme.bodyMedium
                                ?.copyWith(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ================= BODY =================
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: _screens,
            ),
          ),
        ],
      ),

      // ================= MODERN NAVIGATION =================
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: NavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedIndex: _currentIndex,
            indicatorColor: const Color(0xFFE3F2FD),
            height: 85,

            onDestinationSelected: (i) {
              setState(() => _currentIndex = i);
            },

            destinations: [
              NavigationDestination(
                icon: _healthNavIcon(
                  image:
                      "https://cdn-icons-png.flaticon.com/512/3209/3209265.png",
                  selected: _currentIndex == 0,
                ),
                selectedIcon: _healthNavIcon(
                  image:
                      "https://cdn-icons-png.flaticon.com/512/3209/3209265.png",
                  selected: true,
                ),
                label: "Home",
              ),

              NavigationDestination(
                icon: _healthNavIcon(
                  image:
                      "https://cdn-icons-png.flaticon.com/512/2966/2966480.png",
                  selected: _currentIndex == 1,
                ),
                selectedIcon: _healthNavIcon(
                  image:
                      "https://cdn-icons-png.flaticon.com/512/2966/2966480.png",
                  selected: true,
                ),
                label: "History",
              ),

              NavigationDestination(
                icon: _healthNavIcon(
                  image:
                      "https://cdn-icons-png.flaticon.com/512/387/387561.png",
                  selected: _currentIndex == 2,
                ),
                selectedIcon: _healthNavIcon(
                  image:
                      "https://cdn-icons-png.flaticon.com/512/387/387561.png",
                  selected: true,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= CUSTOM HEALTH ICON =================
  Widget _healthNavIcon({
    required String image,
    required bool selected,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFFD9F0FF)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.network(
        image,
        width: selected ? 32 : 25,
        height: selected ? 32 : 25,
      ),
    );
  }
}