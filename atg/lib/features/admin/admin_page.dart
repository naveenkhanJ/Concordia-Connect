import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:atg/features/admin/invite_members_page.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  // Color System
  static const Color _primary = Color(0xFF0065B3);
  static const Color _bgLight = Color(0xFFF8FAFB);
  static const Color _surfaceLight = Color(0xFFFFFFFF);
  static const Color _textPrimary = Color(0xFF1A202C);
  static const Color _textSecondary = Color(0xFF64748B);
  static const Color _textTertiary = Color(0xFF94A3B8);
  static const Color _borderLight = Color(0xFFF0F4F8);
  
  // Accent Colors
  static const Color _accentPurple = Color(0xFF9F7AEA);
  static const Color _accentGreen = Color(0xFF38B2AC);
  static const Color _accentOrange = Color(0xFFED8936);
  static const Color _accentBlue = Color(0xFF4299E1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgLight,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Admin Header
            _buildAdminHeader(),
            const SizedBox(height: 24),

            // Quick Stats
            _buildQuickStats(),
            const SizedBox(height: 24),

            // Management Options
            Text(
              'Management',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: _textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            // Invite New Members - Primary Action
            _buildManagementCard(
              context: context,
              icon: LucideIcons.userPlus,
              title: 'Invite New Members',
              description: 'Share invite link to add team members',
              color: _primary,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InviteMembersPage(),
                  ),
                );
              },
              isPrimary: true,
            ),
            const SizedBox(height: 12),

            _buildManagementCard(
              context: context,
              icon: LucideIcons.users,
              title: 'User Management',
              description: 'Manage users, roles, and permissions',
              color: _accentPurple,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            _buildManagementCard(
              context: context,
              icon: LucideIcons.building,
              title: 'Workspace Settings',
              description: 'Configure workspace preferences',
              color: _accentBlue,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            _buildManagementCard(
              context: context,
              icon: LucideIcons.barChart3,
              title: 'Analytics & Reports',
              description: 'View usage statistics and reports',
              color: _accentGreen,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            _buildManagementCard(
              context: context,
              icon: LucideIcons.shield,
              title: 'Security & Audit',
              description: 'Security settings and audit logs',
              color: _accentOrange,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [_primary, _primary.withBlue(200)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _primary.withAlpha(50),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(50),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
              child: Icon(
                LucideIcons.shieldCheck,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin Dashboard',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Full administrative access',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withAlpha(200),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: LucideIcons.users,
            value: '24',
            label: 'Users',
            color: _accentPurple,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            icon: LucideIcons.building,
            value: '5',
            label: 'Workspaces',
            color: _accentBlue,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            icon: LucideIcons.checkSquare,
            value: '128',
            label: 'Tasks',
            color: _accentGreen,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _surfaceLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _borderLight, width: 1.5),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: _textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: _textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildManagementCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return Material(
      color: isPrimary ? color : _surfaceLight,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isPrimary ? Colors.transparent : _borderLight,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isPrimary ? Colors.white.withAlpha(50) : color.withAlpha(25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 24,
                    color: isPrimary ? Colors.white : color,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isPrimary ? Colors.white : _textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 13,
                        color: isPrimary ? Colors.white.withAlpha(200) : _textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                LucideIcons.chevronRight,
                size: 20,
                color: isPrimary ? Colors.white.withAlpha(200) : _textTertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
