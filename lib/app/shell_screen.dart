import 'package:flutter/material.dart';

import '../features/home/presentation/screens/home_screen.dart';
import '../features/history/presentation/screens/history_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen>
    with TickerProviderStateMixin {
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

  // ================= HEALTH IMAGES =================
  final List<String> _headerImages = [
    "https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?q=80&w=1200&auto=format&fit=crop",
    "https://images.unsplash.com/photo-1604881991720-f91add269bed?q=80&w=1200&auto=format&fit=crop",
    "https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?q=80&w=1200&auto=format&fit=crop",
  ];

  late AnimationController _floatingController;
  late AnimationController _fadeController;

  late Animation<double> _floatingAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Floating animation
    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    // Fade animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _floatingAnimation = Tween<double>(
      begin: -6,
      end: 8,
    ).animate(
      CurvedAnimation(
        parent: _floatingController,
        curve: Curves.easeInOut,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _floatingController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FB),

      body: Column(
        children: [
          // ================= ANIMATED HEADER =================
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            child: Container(
              key: ValueKey(_currentIndex),
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
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
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.25),
                      Colors.black.withOpacity(0.82),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 18,
                    ),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          // ================= TOP BAR =================
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              // Animated health logo
                              AnimatedBuilder(
                                animation:
                                    _floatingAnimation,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(
                                      0,
                                      _floatingAnimation
                                          .value,
                                    ),
                                    child: child,
                                  );
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.all(
                                          15),
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                        .withOpacity(0.15),
                                    borderRadius:
                                        BorderRadius
                                            .circular(20),
                                    border: Border.all(
                                      color:
                                          Colors.white24,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.cyan
                                            .withOpacity(
                                                0.25),
                                        blurRadius: 20,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons
                                        .health_and_safety_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),

                              // Animated avatar
                              TweenAnimationBuilder(
                                tween: Tween<double>(
                                  begin: 0.8,
                                  end: 1,
                                ),
                                duration:
                                    const Duration(
                                        milliseconds:
                                            800),
                                curve: Curves.elasticOut,
                                builder:
                                    (context, value,
                                        child) {
                                  return Transform.scale(
                                    scale: value,
                                    child: child,
                                  );
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets
                                          .all(3),
                                  decoration:
                                      BoxDecoration(
                                    shape:
                                        BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          Colors.white,
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors
                                            .white
                                            .withOpacity(
                                                0.25),
                                        blurRadius: 15,
                                      ),
                                    ],
                                  ),
                                  child:
                                      const CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        NetworkImage(
                                      "https://i.pravatar.cc/300",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const Spacer(),

                          // ================= ANIMATED TITLE =================
                          TweenAnimationBuilder(
                            tween: Tween<double>(
                              begin: 40,
                              end: 0,
                            ),
                            duration:
                                const Duration(
                                    milliseconds: 900),
                            curve: Curves.easeOutBack,
                            builder:
                                (context, value, child) {
                              return Transform.translate(
                                offset:
                                    Offset(value, 0),
                                child: child,
                              );
                            },
                            child: Text(
                              _titles[_currentIndex],
                              style: theme
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                color: Colors.white,
                                fontWeight:
                                    FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          TweenAnimationBuilder(
                            tween: Tween<double>(
                              begin: 0,
                              end: 1,
                            ),
                            duration:
                                const Duration(
                                    milliseconds:
                                        1200),
                            builder:
                                (context, value,
                                    child) {
                              return Opacity(
                                opacity: value,
                                child: child,
                              );
                            },
                            child: Text(
                              "AI-powered healthcare experience",
                              style: theme
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // ================= HEALTH STATUS CARD =================
                          AnimatedContainer(
                            duration: const Duration(
                                milliseconds: 700),
                            padding:
                                const EdgeInsets.all(
                                    16),
                            decoration: BoxDecoration(
                              color: Colors.white
                                  .withOpacity(0.15),
                              borderRadius:
                                  BorderRadius
                                      ..circular(22),
                              border: Border.all(
                                color: Colors.white24,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(
                                          0.15),
                                  blurRadius: 18,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets
                                          .all(12),
                                  decoration:
                                      BoxDecoration(
                                    color: Colors.red
                                        .withOpacity(
                                            0.15),
                                    shape:
                                        BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ),

                                const SizedBox(
                                    width: 14),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                    children: const [
                                      Text(
                                        "Health Status",
                                        style:
                                            TextStyle(
                                          color: Colors
                                              .white,
                                          fontWeight:
                                              FontWeight
                                                  .bold,
                                        ),
                                      ),
                                      SizedBox(
                                          height: 4),
                                      Text(
                                        "Monitoring symptoms & AI diagnosis",
                                        style:
                                            TextStyle(
                                          color: Colors
                                              .white70,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const Icon(
                                  Icons
                                      .arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ================= BODY =================
          Expanded(
            child: AnimatedSwitcher(
              duration:
                  const Duration(milliseconds: 500),
              child: IndexedStack(
                key: ValueKey(_currentIndex),
                index: _currentIndex,
                children: _screens,
              ),
            ),
          ),
        ],
      ),

      // ================= MODERN NAVIGATION =================
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: Container(
          height: 86,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.08),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: NavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedIndex: _currentIndex,
            indicatorColor:
                const Color(0xFFE3F2FD),
            height: 86,

            onDestinationSelected: (i) {
              setState(() {
                _currentIndex = i;
                _fadeController.reset();
                _fadeController.forward();
              });
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

  // ================= ANIMATED NAV ICON =================
  Widget _healthNavIcon({
    required String image,
    required bool selected,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFFD9F0FF)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        boxShadow: selected
            ? [
                BoxShadow(
                  color:
                      Colors.blue.withOpacity(0.2),
                  blurRadius: 15,
                ),
              ]
            : [],
      ),
      child: AnimatedScale(
        duration:
            const Duration(milliseconds: 300),
        scale: selected ? 1.15 : 1,
        child: Image.network(
          image,
          width: selected ? 32 : 25,
          height: selected ? 32 : 25,
        ),
      ),
    );
  }
}