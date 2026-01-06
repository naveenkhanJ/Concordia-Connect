import 'dart:math' as math;
import 'package:atg/features/workspace/workspace_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {
  // Premium Color System
  static const Color _primary = Color(0xFF0066CC);
  static const Color _primaryDark = Color(0xFF0052A3);
  static const Color _bgLight = Color(0xFFF8FAFC);
  static const Color _surfaceLight = Color(0xFFFFFFFF);
  static const Color _textPrimary = Color(0xFF1A202C);
  static const Color _textSecondary = Color(0xFF64748B);
  static const Color _textTertiary = Color(0xFF94A3B8);

  // Accent Colors
  static const Color _accentGreen = Color(0xFF10B981);
  static const Color _accentOrange = Color(0xFFF97316);
  static const Color _accentBlue = Color(0xFF3B82F6);
  static const Color _accentPurple = Color(0xFF8B5CF6);
  static const Color _accentIndigo = Color(0xFF6366F1);

  // Page Controller
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Animation Controllers
  late AnimationController _orbitController;
  late AnimationController _floatController;
  late AnimationController _pulseController;

  // Onboarding Data
  final List<Map<String, dynamic>> _onboardingData = [
    {
      'title': 'Welcome to',
      'titleHighlight': 'Concordia Connect',
      'description':
          'One hub to manage tasks and bridge the gap between your teams.',
      'icon': LucideIcons.network,
      'color': _primary,
    },
    {
      'title': 'Manage Your',
      'titleHighlight': 'Tasks Efficiently',
      'description':
          'Organize tasks, set priorities, and track progress with intuitive boards.',
      'icon': LucideIcons.checkSquare,
      'color': _accentGreen,
    },
    {
      'title': 'Collaborate With',
      'titleHighlight': 'Your Team',
      'description':
          'Connect with your team, share files, and communicate seamlessly.',
      'icon': LucideIcons.users,
      'color': _accentPurple,
    },
    {
      'title': 'Stay Updated With',
      'titleHighlight': 'Smart Alerts',
      'description':
          'Get intelligent notifications for deadlines, mentions, and activities.',
      'icon': LucideIcons.bell,
      'color': _accentOrange,
    },
  ];

  @override
  void initState() {
    super.initState();

    _orbitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _orbitController.dispose();
    _floatController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgLight,
      body: SafeArea(
        child: Stack(
          children: [
            // Animated Background Blobs
            _buildAnimatedBackground(),

            // Content
            Column(
              children: [
                // Skip Button
                if (_currentPage < _onboardingData.length - 1)
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton(
                        onPressed: _goToLogin,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: _textTertiary,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 56),

                // PageView
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _onboardingData.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _buildOnboardingPage(_onboardingData[index]);
                    },
                  ),
                ),

                // Bottom Section
                _buildBottomSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedBackground() {
    return Stack(
      children: [
        // Top Left Blob
        Positioned(
          top: -50,
          left: -100,
          child: AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Transform.scale(
                scale: 1 + (_pulseController.value * 0.1),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        _primary.withOpacity(0.15),
                        _primary.withOpacity(0.0),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
        // Top Right Blob
        Positioned(
          top: -50,
          right: -100,
          child: AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Transform.scale(
                scale: 1 + ((1 - _pulseController.value) * 0.1),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        _accentIndigo.withOpacity(0.12),
                        _accentIndigo.withOpacity(0.0),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
        // Bottom Blob
        Positioned(
          bottom: -100,
          left: 50,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  _accentBlue.withOpacity(0.08),
                  _accentBlue.withOpacity(0.0),
                ],
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOnboardingPage(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Orbital Illustration
          _buildOrbitalIllustration(data),
          const SizedBox(height: 50),

          // Title with Highlight
          Text(
            data['title'] as String,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: _textPrimary,
              letterSpacing: -0.5,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [_primary, _accentIndigo],
            ).createShader(bounds),
            child: Text(
              data['titleHighlight'] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.5,
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Description
          Text(
            data['description'] as String,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: _textSecondary,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrbitalIllustration(Map<String, dynamic> data) {
    return SizedBox(
      width: 280,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Orbit Ring
          AnimatedBuilder(
            animation: _orbitController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _orbitController.value * 2 * math.pi,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _textTertiary.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Orbiting Dot
                      Positioned(
                        top: 0,
                        left: 130 - 6,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: _primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: _primary.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Inner Dashed Orbit Ring
          AnimatedBuilder(
            animation: _orbitController,
            builder: (context, child) {
              return Transform.rotate(
                angle: -_orbitController.value * 2 * math.pi,
                child: CustomPaint(
                  size: const Size(180, 180),
                  painter: DashedCirclePainter(
                    color: _textTertiary.withOpacity(0.3),
                  ),
                ),
              );
            },
          ),

          // Glow Effect
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Container(
                width: 120 + (_pulseController.value * 20),
                height: 120 + (_pulseController.value * 20),
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      (data['color'] as Color).withOpacity(0.3),
                      (data['color'] as Color).withOpacity(0.0),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
              );
            },
          ),

          // Central Icon Card
          AnimatedBuilder(
            animation: _floatController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, -10 * _floatController.value),
                child: Transform.rotate(
                  angle: 0.1,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _surfaceLight.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1E3A5F).withOpacity(0.1),
                          blurRadius: 30,
                          spreadRadius: 5,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [_primary, _accentIndigo],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Icon(
                          data['icon'] as IconData,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // Floating Accent Icons
          _buildFloatingIcon(
            top: 10,
            right: 30,
            icon: LucideIcons.checkCircle,
            color: _accentGreen,
            delay: 0,
          ),
          _buildFloatingIcon(
            bottom: 60,
            left: 10,
            icon: LucideIcons.users,
            color: _accentOrange,
            delay: 1,
          ),
          _buildFloatingIcon(
            bottom: 30,
            right: 20,
            icon: LucideIcons.share2,
            color: _accentBlue,
            delay: 0.5,
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingIcon({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required IconData icon,
    required Color color,
    required double delay,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: AnimatedBuilder(
        animation: _floatController,
        builder: (context, child) {
          final adjustedValue = ((_floatController.value + delay) % 1.0);
          return Transform.translate(
            offset: Offset(0, -8 * math.sin(adjustedValue * math.pi)),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _surfaceLight,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: _textTertiary.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Icon(icon, size: 22, color: color),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 40),
      child: Column(
        children: [
          // Page Indicator
          SmoothPageIndicator(
            controller: _pageController,
            count: _onboardingData.length,
            effect: ExpandingDotsEffect(
              activeDotColor: _primary,
              dotColor: _textTertiary.withOpacity(0.3),
              dotHeight: 8,
              dotWidth: 8,
              spacing: 12,
              expansionFactor: 4,
            ),
          ),
          const SizedBox(height: 32),

          // Next Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _goToNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: _primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                shadowColor: _primary.withOpacity(0.4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _currentPage == _onboardingData.length - 1
                        ? 'Get Started'
                        : 'Next',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  if (_currentPage < _onboardingData.length - 1)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(LucideIcons.arrowRight, size: 20),
                    ),
                ],
              ),
            ),
          ),

          // Sign In Link (only on last page)
          if (_currentPage == _onboardingData.length - 1) ...[
            const SizedBox(height: 20),
            TextButton(
              onPressed: _goToLogin,
              child: Text.rich(
                TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: _textTertiary, fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        color: _primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _goToNext() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLogin();
    }
  }

  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WorkspaceSelectionPage()),
    );
  }
}

// Custom Painter for Dashed Circle
class DashedCirclePainter extends CustomPainter {
  final Color color;

  DashedCirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    const dashCount = 40;
    const dashLength = 0.08;
    const gapLength = 0.08;

    for (int i = 0; i < dashCount; i++) {
      final startAngle = (i * (dashLength + gapLength)) * 2 * math.pi;
      final sweepAngle = dashLength * 2 * math.pi;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
