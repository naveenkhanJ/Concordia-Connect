import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:share_plus/share_plus.dart';

class InviteMembersPage extends StatefulWidget {
  const InviteMembersPage({super.key});

  @override
  State<InviteMembersPage> createState() => _InviteMembersPageState();
}

class _InviteMembersPageState extends State<InviteMembersPage> {
  // Color System
  static const Color _primary = Color(0xFF0065B3);
  static const Color _bgLight = Color(0xFFF8FAFB);
  static const Color _surfaceLight = Color(0xFFFFFFFF);
  static const Color _textPrimary = Color(0xFF1A202C);
  static const Color _textSecondary = Color(0xFF64748B);
  static const Color _textTertiary = Color(0xFF94A3B8);
  static const Color _borderLight = Color(0xFFF0F4F8);
  static const Color _accentGreen = Color(0xFF38B2AC);

  // Generate a unique invite link (in real app, this would come from backend)
  final String _inviteLink = 'https://concordia.app/invite/abc123xyz789';
  bool _linkCopied = false;

  void _copyLink() async {
    await Clipboard.setData(ClipboardData(text: _inviteLink));
    setState(() => _linkCopied = true);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(LucideIcons.check, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            const Text('Invite link copied to clipboard!'),
          ],
        ),
        backgroundColor: _accentGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );

    // Reset copied state after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _linkCopied = false);
      }
    });
  }

  void _shareLink() {
    Share.share(
      'Join our workspace on Concordia Connect!\n\n$_inviteLink',
      subject: 'Concordia Connect Workspace Invitation',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgLight,
      appBar: AppBar(
        backgroundColor: _surfaceLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: _textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Invite Members',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: _textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeaderSection(),
            const SizedBox(height: 32),

            // Invite Link Card
            _buildInviteLinkCard(),
            const SizedBox(height: 24),

            // Action Buttons
            _buildActionButtons(),
            const SizedBox(height: 32),

            // Info Section
            _buildInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [_primary, _primary.withBlue(180)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: _primary.withAlpha(60),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(40),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                LucideIcons.userPlus,
                size: 36,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Invite New Members',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Share this link to invite team members to your workspace',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withAlpha(200),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInviteLinkCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _borderLight, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.link, size: 20, color: _primary),
              const SizedBox(width: 10),
              Text(
                'Invite Link',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: _bgLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _borderLight),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _inviteLink,
                    style: TextStyle(
                      fontSize: 13,
                      color: _textSecondary,
                      fontFamily: 'monospace',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _copyLink,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _linkCopied ? _accentGreen : _primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _linkCopied ? LucideIcons.check : LucideIcons.copy,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Copy Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _copyLink,
            icon: Icon(_linkCopied ? LucideIcons.check : LucideIcons.copy, size: 20),
            label: Text(_linkCopied ? 'Link Copied!' : 'Copy Invite Link'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _linkCopied ? _accentGreen : _primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Share Button
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _shareLink,
            icon: const Icon(LucideIcons.share2, size: 20),
            label: const Text('Share Invite Link'),
            style: OutlinedButton.styleFrom(
              foregroundColor: _primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              side: BorderSide(color: _primary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _primary.withAlpha(15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _primary.withAlpha(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.info, size: 18, color: _primary),
              const SizedBox(width: 8),
              Text(
                'How it works',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildInfoItem('1', 'Copy or share the invite link'),
          const SizedBox(height: 8),
          _buildInfoItem('2', 'New members open the link'),
          const SizedBox(height: 8),
          _buildInfoItem('3', 'They sign up using the link'),
          const SizedBox(height: 8),
          _buildInfoItem('4', 'They automatically join your workspace'),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: _primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: _textSecondary,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
