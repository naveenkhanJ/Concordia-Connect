import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:atg/features/workspace/un_staff_signup_page.dart';
import 'package:atg/features/workspace/external_user_signup_page.dart';

class JoinInviteLinkPage extends StatefulWidget {
  const JoinInviteLinkPage({super.key});

  @override
  State<JoinInviteLinkPage> createState() => _JoinInviteLinkPageState();
}

class _JoinInviteLinkPageState extends State<JoinInviteLinkPage> {
  // Color System
  static const Color _primary = Color(0xFF137FEC);
  static const Color _bgLight = Color(0xFFF6F7F8);
  static const Color _surfaceLight = Color(0xFFFFFFFF);
  static const Color _textPrimary = Color(0xFF0D141B);
  static const Color _textSecondary = Color(0xFF64748B);
  static const Color _borderLight = Color(0xFFE2E8F0);
  static const Color _accentGreen = Color(0xFF38B2AC);

  final TextEditingController _linkController = TextEditingController();
  String _selectedUserType = ''; // 'un_staff' or 'external_user'

  @override
  void dispose() {
    _linkController.dispose();
    super.dispose();
  }

  bool get _canProceed =>
      _linkController.text.isNotEmpty && _selectedUserType.isNotEmpty;

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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    // Hero Section
                    _buildHeroSection(),

                    const SizedBox(height: 32),

                    // Invite Link Input
                    _buildLinkInput(),

                    const SizedBox(height: 32),

                    // User Type Selection
                    _buildUserTypeSection(),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // Next Button
            _buildNextButton(),
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
              'Join Workspace',
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
        // Icon Container
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: _primary.withAlpha(25),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              LucideIcons.link2,
              size: 36,
              color: _primary,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Title
        Text(
          'Join with Invite Link',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: _textPrimary,
            letterSpacing: -0.5,
          ),
        ),

        const SizedBox(height: 8),

        // Subtitle
        Text(
          'Paste your organization invite link and select your user type to continue.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: _textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildLinkInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          'Invite Link',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),

        const SizedBox(height: 10),

        // Input Field
        Container(
          decoration: BoxDecoration(
            color: _surfaceLight,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _linkController.text.isNotEmpty ? _primary : _borderLight,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(8),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _linkController,
            onChanged: (_) => setState(() {}),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: _textPrimary,
            ),
            decoration: InputDecoration(
              hintText: 'https://concordia.link/invite/...',
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: _textSecondary.withAlpha(150),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 14, right: 10),
                child: Icon(
                  LucideIcons.link,
                  size: 20,
                  color: _textSecondary,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 44,
                minHeight: 44,
              ),
              suffixIcon: _linkController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _linkController.clear();
                        setState(() {});
                      },
                      icon: Icon(
                        LucideIcons.x,
                        size: 18,
                        color: _textSecondary,
                      ),
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Helper Text
        Row(
          children: [
            Icon(
              LucideIcons.info,
              size: 14,
              color: _textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              'Paste the invite link shared by your organization admin',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: _textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUserTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          'Select User Type',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),

        const SizedBox(height: 12),

        // UN Staff Option
        _buildUserTypeOption(
          id: 'un_staff',
          icon: LucideIcons.building2,
          title: 'UN Staff',
          description: 'I am a United Nations staff member',
          isSelected: _selectedUserType == 'un_staff',
        ),

        const SizedBox(height: 12),

        // External User Option
        _buildUserTypeOption(
          id: 'external_user',
          icon: LucideIcons.userCircle,
          title: 'External User',
          description: 'I am an external partner or collaborator',
          isSelected: _selectedUserType == 'external_user',
        ),
      ],
    );
  }

  Widget _buildUserTypeOption({
    required String id,
    required IconData icon,
    required String title,
    required String description,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedUserType = id;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? _primary.withAlpha(15) : _surfaceLight,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? _primary : _borderLight,
            width: isSelected ? 2 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(isSelected ? 15 : 8),
              blurRadius: isSelected ? 12 : 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon Container
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected ? _primary.withAlpha(30) : _primary.withAlpha(20),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 24,
                  color: isSelected ? _primary : _textSecondary,
                ),
              ),
            ),

            const SizedBox(width: 14),

            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? _primary : _textPrimary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Radio Indicator
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? _primary : Colors.transparent,
                border: Border.all(
                  color: isSelected ? _primary : _borderLight,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        LucideIcons.check,
                        size: 14,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: _surfaceLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: _canProceed
                ? () {
                    // Handle next action
                    _handleNext();
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: _primary,
              disabledBackgroundColor: _primary.withAlpha(100),
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.white.withAlpha(150),
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  LucideIcons.arrowRight,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleNext() {
    // Validate link format (basic validation)
    final link = _linkController.text.trim();
    
    if (link.isEmpty) {
      _showError('Please enter an invite link');
      return;
    }

    // Navigate based on user type selection
    if (_selectedUserType == 'un_staff') {
      // Navigate to UN Staff sign up page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UnStaffSignUpPage(inviteLink: link),
        ),
      );
    } else if (_selectedUserType == 'external_user') {
      // Navigate to External User sign up page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExternalUserSignUpPage(inviteLink: link),
        ),
      );
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(LucideIcons.alertCircle, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
