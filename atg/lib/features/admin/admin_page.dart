import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:atg/features/admin/invite_members_page.dart';
import 'package:atg/core/pending_approval_service.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
  static const Color _accentRed = Color(0xFFF56565);

  @override
  void initState() {
    super.initState();
    // Listen for changes in pending approvals
    PendingApprovalService().addListener(_onPendingApprovalsChanged);
  }

  @override
  void dispose() {
    PendingApprovalService().removeListener(_onPendingApprovalsChanged);
    super.dispose();
  }

  void _onPendingApprovalsChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final pendingRequests = PendingApprovalService().pendingRequests;

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

            // Pending Approvals Section (if any)
            if (pendingRequests.isNotEmpty) ...[
              _buildPendingApprovalsSection(pendingRequests),
              const SizedBox(height: 24),
            ],

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
    final pendingCount = PendingApprovalService().pendingCount;

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
            icon: LucideIcons.clock,
            value: '$pendingCount',
            label: 'Pending',
            color: _accentOrange,
            highlight: pendingCount > 0,
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
    bool highlight = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: highlight ? _accentOrange.withAlpha(20) : _surfaceLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: highlight ? _accentOrange.withAlpha(100) : _borderLight,
          width: 1.5,
        ),
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

  Widget _buildPendingApprovalsSection(List<PendingApprovalRequest> requests) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(LucideIcons.userCheck, size: 20, color: _accentOrange),
            const SizedBox(width: 8),
            Text(
              'Pending Approvals',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: _textPrimary,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: _accentOrange.withAlpha(30),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${requests.length}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: _accentOrange,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...requests.map((request) => _buildPendingRequestCard(request)),
      ],
    );
  }

  Widget _buildPendingRequestCard(PendingApprovalRequest request) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _surfaceLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _accentOrange.withAlpha(50), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          Row(
            children: [
              // Avatar
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_primary, _accentBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    request.username.isNotEmpty
                        ? request.username.substring(0, 2).toUpperCase()
                        : 'UN',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // User Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.username,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: _textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      request.email,
                      style: TextStyle(
                        fontSize: 13,
                        color: _textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              // User Type Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: _primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  request.userType == 'un_staff' ? 'UN Staff' : 'External',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: _primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Show UN ID for UN Staff or Identity Proof for External Users
          if (request.userType == 'un_staff') ...[  
            // UN ID Info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _bgLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(LucideIcons.badgeCheck, size: 18, color: _textSecondary),
                  const SizedBox(width: 10),
                  Text(
                    'UN ID: ',
                    style: TextStyle(
                      fontSize: 13,
                      color: _textTertiary,
                    ),
                  ),
                  Text(
                    request.unId,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: _textPrimary,
                    ),
                  ),
                  const Spacer(),
                  Icon(LucideIcons.clock, size: 14, color: _textTertiary),
                  const SizedBox(width: 6),
                  Text(
                    _formatTimeAgo(request.requestedAt),
                    style: TextStyle(
                      fontSize: 12,
                      color: _textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ] else if (request.userType == 'external_user') ...[
            // Identity Proof Section
            _buildIdentityProofSection(request),
          ],

          const SizedBox(height: 14),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _rejectRequest(request),
                  icon: const Icon(LucideIcons.x, size: 18),
                  label: const Text('Reject'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _accentRed,
                    side: BorderSide(color: _accentRed.withAlpha(100)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _approveRequest(request),
                  icon: const Icon(LucideIcons.check, size: 18),
                  label: const Text('Approve'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _accentGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _approveRequest(PendingApprovalRequest request) {
    PendingApprovalService().approveRequest(request.id);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(LucideIcons.checkCircle, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '${request.username} has been approved',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: _accentGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _rejectRequest(PendingApprovalRequest request) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Reject Request'),
        content: Text(
          'Are you sure you want to reject the registration request from ${request.username}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: _textSecondary),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              PendingApprovalService().rejectRequest(request.id);
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(LucideIcons.xCircle, color: Colors.white, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${request.username}\'s request has been rejected',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: _accentRed,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(16),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _accentRed,
              foregroundColor: Colors.white,
            ),
            child: const Text('Reject'),
          ),
        ],
      ),
    );
  }

  Widget _buildIdentityProofSection(PendingApprovalRequest request) {
    final hasImage = request.identityProofPath != null && 
                     request.identityProofPath!.isNotEmpty;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with time
        Row(
          children: [
            Icon(LucideIcons.clock, size: 18, color: _textSecondary),
            const SizedBox(width: 8),
            Text(
              'Identity Proof',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: _textPrimary,
              ),
            ),
            const Spacer(),
            Icon(LucideIcons.clock, size: 14, color: _textTertiary),
            const SizedBox(width: 6),
            Text(
              _formatTimeAgo(request.requestedAt),
              style: TextStyle(
                fontSize: 12,
                color: _textTertiary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        
        // Image Preview
        GestureDetector(
          onTap: hasImage ? () => _showImagePreview(request.identityProofPath!) : null,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: _bgLight,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: hasImage ? _accentPurple.withAlpha(50) : _borderLight,
                width: 1.5,
              ),
            ),
            child: hasImage
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          File(request.identityProofPath!),
                          fit: BoxFit.cover,
                        ),
                        // Overlay to indicate tappable
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(150),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  LucideIcons.expand,
                                  size: 12,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'View',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          LucideIcons.imageOff,
                          size: 24,
                          color: _textTertiary,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'No image uploaded',
                          style: TextStyle(
                            fontSize: 12,
                            color: _textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  void _showImagePreview(String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(150),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    LucideIcons.x,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                File(imagePath),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            // Title
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(150),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Identity Proof Document',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
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
