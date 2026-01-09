import 'package:atg/features/login/login_page.dart';
import 'package:atg/features/workspace/join_invite_link_page.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WorkspaceSelectionPage extends StatelessWidget {
  const WorkspaceSelectionPage({super.key});

  // Color System
  static const Color _primary = Color(0xFF137FEC);
  static const Color _bgLight = Color(0xFFF6F7F8);
  static const Color _surfaceLight = Color(0xFFFFFFFF);
  static const Color _textPrimary = Color(0xFF0D141B);
  static const Color _textSecondary = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgLight,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            _buildAppBar(context),

            // Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    // Hero Section
                    _buildHeroSection(),

                    const SizedBox(height: 24),

                    // Action Cards
                    _buildActionCard(
                      context,
                      icon: LucideIcons.plus,
                      title: 'Create a new workspace',
                      description:
                          'Create a new workspace for your Organization',
                      onTap: () {
                        // TODO: Navigate to create workspace
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildActionCard(
                      context,
                      icon: LucideIcons.link,
                      title: 'Join with Invite link',
                      description: 'Enter your Organization link to connect',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const JoinInviteLinkPage(),
                          ),
                        );
                      },
                    ),

                    const Spacer(),

                    // Footer
                    _buildFooter(context),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Row(
        children: [
          // Back Button
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(LucideIcons.chevronLeft),
            iconSize: 24,
            style: IconButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: _textPrimary,
            ),
          ),

          // Title
          Expanded(
            child: Text(
              'Workspace',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: _textPrimary,
                letterSpacing: -0.3,
              ),
            ),
          ),

          // Placeholder for symmetry
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Column(
      children: [
        const SizedBox(height: 24),

        // Icon Container
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            color: _primary.withAlpha(25),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(LucideIcons.network, size: 40, color: _primary),
          ),
        ),

        const SizedBox(height: 24),

        // Title
        Text(
          "Let's get started",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: _textPrimary,
            letterSpacing: -0.5,
          ),
        ),

        const SizedBox(height: 8),

        // Subtitle
        Text(
          'Choose how you want to connect with your team today.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _textSecondary,
            height: 1.5,
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Material(
      color: _surfaceLight,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.transparent, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(10),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Container
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _primary.withAlpha(25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Icon(icon, size: 26, color: _primary)),
              ),

              const SizedBox(height: 16),

              // Title
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _textPrimary,
                ),
              ),

              const SizedBox(height: 6),

              // Description
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _textSecondary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _textSecondary,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: Text(
            'Log in',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: _primary,
            ),
          ),
        ),
      ],
    );
  }
}
