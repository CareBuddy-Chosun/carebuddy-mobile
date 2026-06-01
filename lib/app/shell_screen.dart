import 'dart:ui';
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

  final List<String> _headerImages = [
    // Virus image
    "https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?q=80&w=1200&auto=format&fit=crop",

    // Headache image
    "https://images.unsplash.com/photo-1604881991720-f91add269bed?q=80&w=1200&auto=format&fit=crop",

    // Doctor image
    "https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?q=80&w=1200&auto=format&fit=crop",
  ];

  // ================= ANIMATIONS =================
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  late AnimationController _rotateController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    // HEART PULSE
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(
      begin: 1,
      end: 1.12,
    ).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );

    // HEADER SLIDE
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeOutExpo,
      ),
    );

    // HEART ROTATION
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    _rotateAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_rotateController);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _slideController.dispose();
    _rotateController.dispose();
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
          SlideTransition(
            position: _slideAnimation,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              child: Container(
                key: ValueKey(_currentIndex),
                height: 310,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),

                  image: DecorationImage(
                    image: NetworkImage(
                      _headerImages[_currentIndex],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Stack(
                  children: [
                    // ================= DARK OVERLAY =================
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.only(
                          bottomLeft:
                              Radius.circular(40),
                          bottomRight:
                              Radius.circular(40),
                        ),

                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black
                                .withOpacity(0.2),
                            Colors.black
                                .withOpacity(0.85),
                          ],
                        ),
                      ),
                    ),

                    // ================= BLUR =================
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.only(
                        bottomLeft:
                            Radius.circular(40),
                        bottomRight:
                            Radius.circular(40),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 1.5,
                          sigmaY: 1.5,
                        ),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),

                    // ================= CONTENT =================
                    SafeArea(
                      child: Padding(
                        padding:
                            const EdgeInsets.all(22),

                        child: SingleChildScrollView(
                          physics:
                              const NeverScrollableScrollPhysics(),

                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,

                            children: [
                              // ================= TOP BAR =================
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,

                                children: [
                                  // ANIMATED HEART
                                  RotationTransition(
                                    turns:
                                        _rotateAnimation,

                                    child:
                                        ScaleTransition(
                                      scale:
                                          _pulseAnimation,

                                      child:
                                          Container(
                                        padding:
                                            const EdgeInsets
                                                .all(
                                                    16),

                                        decoration:
                                            BoxDecoration(
                                          shape: BoxShape
                                              .circle,

                                          gradient:
                                              const LinearGradient(
                                            colors: [
                                              Color(
                                                  0xFF00C6FF),
                                              Color(
                                                  0xFF0072FF),
                                            ],
                                          ),

                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors
                                                  .blue
                                                  .withOpacity(
                                                      0.45),

                                              blurRadius:
                                                  25,
                                              spreadRadius:
                                                  3,
                                            ),
                                          ],
                                        ),

                                        child:
                                            const Icon(
                                          Icons
                                              .favorite,

                                          color: Colors
                                              .white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // ================= AVATAR =================
                                  TweenAnimationBuilder(
                                    tween:
                                        Tween<double>(
                                      begin: 0,
                                      end: 1,
                                    ),

                                    duration:
                                        const Duration(
                                      milliseconds:
                                          1200,
                                    ),

                                    curve: Curves
                                        .elasticOut,

                                    builder:
                                        (context,
                                            value,
                                            child) {
                                      return Transform
                                          .translate(
                                        offset:
                                            Offset(
                                          0,
                                          (1 -
                                                  value) *
                                              -40,
                                        ),

                                        child:
                                            Opacity(
                                          opacity:
                                              value,
                                          child:
                                              child,
                                        ),
                                      );
                                    },

                                    child: Container(
                                      padding:
                                          const EdgeInsets
                                              .all(
                                                  3),

                                      decoration:
                                          BoxDecoration(
                                        shape: BoxShape
                                            .circle,

                                        border:
                                            Border.all(
                                          color: Colors
                                              .white,
                                          width: 2,
                                        ),

                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors
                                                .white
                                                .withOpacity(
                                                    0.3),

                                            blurRadius:
                                                20,
                                          ),
                                        ],
                                      ),

                                      child:
                                          const CircleAvatar(
                                        radius: 27,

                                        backgroundImage:
                                            NetworkImage(
                                          "https://i.pravatar.cc/300",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                  height: 30),

                              // ================= TITLE =================
                              TweenAnimationBuilder(
                                tween:
                                    Tween<double>(
                                  begin: 50,
                                  end: 0,
                                ),

                                duration:
                                    const Duration(
                                  milliseconds:
                                      1000,
                                ),

                                curve:
                                    Curves.easeOutBack,

                                builder:
                                    (context,
                                        value,
                                        child) {
                                  return Transform
                                      .translate(
                                    offset: Offset(
                                      value,
                                      0,
                                    ),

                                    child: child,
                                  );
                                },

                                child: Text(
                                  _titles[
                                      _currentIndex],

                                  style: theme
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                    color:
                                        Colors.white,

                                    fontWeight:
                                        FontWeight
                                            .bold,

                                    fontSize: 31,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                  height: 10),

                              // ================= SUBTITLE =================
                              AnimatedOpacity(
                                opacity: 1,

                                duration:
                                    const Duration(
                                  seconds: 2,
                                ),

                                child: Text(
                                  "AI-powered healthcare experience",

                                  style: theme
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                    color: Colors
                                        .white70,

                                    fontSize: 15,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                  height: 22),

                              // ================= HEALTH CARD =================
                              ScaleTransition(
                                scale:
                                    _pulseAnimation,

                                child: Container(
                                  padding:
                                      const EdgeInsets
                                          .all(18),

                                  decoration:
                                      BoxDecoration(
                                    borderRadius:
                                        BorderRadius
                                            .circular(
                                                24),

                                    gradient:
                                        LinearGradient(
                                      colors: [
                                        Colors.white
                                            .withOpacity(
                                                0.18),

                                        Colors.white
                                            .withOpacity(
                                                0.08),
                                      ],
                                    ),

                                    border:
                                        Border.all(
                                      color: Colors
                                          .white24,
                                    ),

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors
                                            .cyan
                                            .withOpacity(
                                                0.25),

                                        blurRadius:
                                            25,
                                      ),
                                    ],
                                  ),

                                  child: Row(
                                    children: [
                                      // HEART ICON
                                      ScaleTransition(
                                        scale:
                                            _pulseAnimation,

                                        child:
                                            Container(
                                          padding:
                                              const EdgeInsets
                                                  .all(
                                                      14),

                                          decoration:
                                              BoxDecoration(
                                            color: Colors
                                                .red
                                                .withOpacity(
                                                    0.2),

                                            shape: BoxShape
                                                .circle,
                                          ),

                                          child:
                                              const Icon(
                                            Icons
                                                .monitor_heart,

                                            color: Colors
                                                .red,

                                            size: 28,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                          width: 14),

                                      Expanded(
                                        child:
                                            Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,

                                          children: const [
                                            Text(
                                              "Live Health Monitoring",

                                              style:
                                                  TextStyle(
                                                color:
                                                    Colors.white,

                                                fontWeight:
                                                    FontWeight.bold,

                                                fontSize:
                                                    16,
                                              ),
                                            ),

                                            SizedBox(
                                                height:
                                                    4),

                                            Text(
                                              "Tracking symptoms in real-time",

                                              style:
                                                  TextStyle(
                                                color:
                                                    Colors.white70,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const Icon(
                                        Icons
                                            .arrow_forward_ios,

                                        color: Colors
                                            .white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ================= BODY =================
          Expanded(
            child: AnimatedSwitcher(
              duration:
                  const Duration(milliseconds: 600),

              child: IndexedStack(
                key: ValueKey(_currentIndex),

                index: _currentIndex,

                children: _screens,
              ),
            ),
          ),
        ],
      ),

      // ================= NAVIGATION =================
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.fromLTRB(16, 0, 16, 20),

        child: Container(
          height: 88,

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
            backgroundColor:
                Colors.transparent,

            elevation: 0,

            selectedIndex: _currentIndex,

            indicatorColor:
                const Color(0xFFE3F2FD),

            height: 88,

            onDestinationSelected: (i) {
              setState(() {
                _currentIndex = i;

                _slideController.reset();
                _slideController.forward();
              });
            },

            destinations: [
              NavigationDestination(
                icon: _healthNavIcon(
                  icon: Icons.home_rounded,
                  selected:
                      _currentIndex == 0,
                ),

                selectedIcon:
                    _healthNavIcon(
                  icon: Icons.home_rounded,
                  selected: true,
                ),

                label: "Home",
              ),

              NavigationDestination(
                icon: _healthNavIcon(
                  icon: Icons.history_rounded,
                  selected:
                      _currentIndex == 1,
                ),

                selectedIcon:
                    _healthNavIcon(
                  icon: Icons.history_rounded,
                  selected: true,
                ),

                label: "History",
              ),

              NavigationDestination(
                icon: _healthNavIcon(
                  icon: Icons.person_rounded,
                  selected:
                      _currentIndex == 2,
                ),

                selectedIcon:
                    _healthNavIcon(
                  icon: Icons.person_rounded,
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

  // ================= NAV ICON =================
  Widget _healthNavIcon({
    required IconData icon,
    required bool selected,
  }) {
    return AnimatedContainer(
      duration:
          const Duration(milliseconds: 300),

      curve: Curves.easeOutBack,

      padding: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFFD9F0FF)
            : Colors.transparent,

        borderRadius:
            BorderRadius.circular(18),

        boxShadow: selected
            ? [
                BoxShadow(
                  color: Colors.blue
                      .withOpacity(0.2),

                  blurRadius: 15,
                ),
              ]
            : [],
      ),

      child: AnimatedScale(
        duration:
            const Duration(milliseconds: 300),

        scale: selected ? 1.15 : 1,

        child: Icon(
          icon,
          color: selected
              ? const Color(0xFF1E88E5)
              : Colors.grey,
          size: selected ? 32 : 25,
        ),
      ),
    );
  }
}