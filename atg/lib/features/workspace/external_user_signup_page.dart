import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:atg/core/pending_approval_service.dart';
import 'package:atg/features/workspace/un_staff_signup_page.dart';

class ExternalUserSignUpPage extends StatefulWidget {
  final String inviteLink;

  const ExternalUserSignUpPage({
    super.key,
    required this.inviteLink,
  });

  @override
  State<ExternalUserSignUpPage> createState() => _ExternalUserSignUpPageState();
}

class _ExternalUserSignUpPageState extends State<ExternalUserSignUpPage> {
  // Color System
  static const Color _primary = Color(0xFF137FEC);
  static const Color _bgLight = Color(0xFFF6F7F8);
  static const Color _surfaceLight = Color(0xFFFFFFFF);
  static const Color _textPrimary = Color(0xFF0D141B);
  static const Color _textSecondary = Color(0xFF64748B);
  static const Color _borderLight = Color(0xFFE2E8F0);
  static const Color _accentGreen = Color(0xFF38B2AC);
  static const Color _accentOrange = Color(0xFFED8936);
  static const Color _accentPurple = Color(0xFF9F7AEA);

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isSubmitting = false;
  XFile? _identityProofImage;

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );
      if (image != null) {
        setState(() {
          _identityProofImage = image;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick image: $e'),
          backgroundColor: Colors.red.shade400,
        ),
      );
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Upload Identity Proof',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: _textPrimary,
                  ),
                ),
              ),
              // Camera Option
              ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _primary.withAlpha(20),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(LucideIcons.camera, color: _primary),
                ),
                title: Text(
                  'Take Photo',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: _textPrimary,
                  ),
                ),
                subtitle: Text(
                  'Use camera to capture ID',
                  style: TextStyle(color: _textSecondary),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              // Gallery Option
              ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _accentPurple.withAlpha(20),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(LucideIcons.image, color: _accentPurple),
                ),
                title: Text(
                  'Choose from Gallery',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: _textPrimary,
                  ),
                ),
                subtitle: Text(
                  'Select an existing photo',
                  style: TextStyle(color: _textSecondary),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      // Hero Section
                      _buildHeroSection(),

                      const SizedBox(height: 32),

                      // Form Fields
                      _buildFormFields(),

                      const SizedBox(height: 24),

                      // Identity Proof Upload
                      _buildIdentityProofSection(),

                      const SizedBox(height: 32),

                      // Info Card
                      _buildInfoCard(),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),

            // Submit Button
            _buildSubmitButton(),
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
              'External User Registration',
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
            color: _accentPurple.withAlpha(25),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              LucideIcons.userCircle,
              size: 36,
              color: _accentPurple,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Title
        Text(
          'Create External Account',
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
          'Fill in your details and upload identity proof to request access.',
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

  Widget _buildFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Username Field
        _buildTextField(
          controller: _usernameController,
          label: 'Username',
          hint: 'Enter your username',
          icon: LucideIcons.user,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a username';
            }
            if (value.length < 3) {
              return 'Username must be at least 3 characters';
            }
            return null;
          },
        ),

        const SizedBox(height: 20),

        // Email Field
        _buildTextField(
          controller: _emailController,
          label: 'Email Address',
          hint: 'Enter your email',
          icon: LucideIcons.mail,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!value.contains('@') || !value.contains('.')) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),

        const SizedBox(height: 20),

        // Password Field
        _buildTextField(
          controller: _passwordController,
          label: 'Password',
          hint: 'Create a password',
          icon: LucideIcons.lock,
          isPassword: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
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
              color: _borderLight,
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
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isPassword && _obscurePassword,
            validator: validator,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: _textPrimary,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: _textSecondary.withAlpha(150),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 14, right: 10),
                child: Icon(
                  icon,
                  size: 20,
                  color: _textSecondary,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 44,
                minHeight: 44,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword
                            ? LucideIcons.eyeOff
                            : LucideIcons.eye,
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
              errorStyle: TextStyle(
                color: Colors.red.shade400,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIdentityProofSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          children: [
            Text(
              'Identity Proof',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _textPrimary,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Required',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.red.shade400,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Upload Area
        GestureDetector(
          onTap: _showImagePickerOptions,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _identityProofImage != null ? 200 : 140,
            width: double.infinity,
            decoration: BoxDecoration(
              color: _identityProofImage != null
                  ? _accentGreen.withAlpha(10)
                  : _surfaceLight,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _identityProofImage != null
                    ? _accentGreen
                    : _borderLight,
                width: _identityProofImage != null ? 2 : 1.5,
                style: _identityProofImage != null
                    ? BorderStyle.solid
                    : BorderStyle.solid,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(8),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: _identityProofImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          File(_identityProofImage!.path),
                          fit: BoxFit.cover,
                        ),
                        // Overlay with change button
                        Positioned(
                          bottom: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(180),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  LucideIcons.refreshCw,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Change Photo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Success indicator
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: _accentGreen,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              LucideIcons.check,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: _primary.withAlpha(15),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          LucideIcons.upload,
                          size: 24,
                          color: _primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Upload ID or Passport',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: _textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tap to take photo or choose from gallery',
                        style: TextStyle(
                          fontSize: 13,
                          color: _textSecondary,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _accentOrange.withAlpha(20),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: _accentOrange.withAlpha(50),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _accentOrange.withAlpha(30),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                LucideIcons.alertCircle,
                size: 20,
                color: _accentOrange,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin Approval Required',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: _textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Your identity will be verified before granting access to the application.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: _textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    final canSubmit = _identityProofImage != null;

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
            onPressed: _isSubmitting || !canSubmit ? null : _handleSubmit,
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
            child: _isSubmitting
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Submitting...',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Submit Request',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        LucideIcons.send,
                        size: 20,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_identityProofImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(LucideIcons.alertCircle, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Text(
                'Please upload identity proof',
                style: const TextStyle(fontWeight: FontWeight.w500),
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
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Create pending approval request
    final request = PendingApprovalRequest(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      username: _usernameController.text.trim(),
      unId: '', // Not applicable for external users
      email: _emailController.text.trim(),
      password: _passwordController.text,
      inviteLink: widget.inviteLink,
      requestedAt: DateTime.now(),
      userType: 'external_user',
      identityProofPath: _identityProofImage?.path,
    );

    // Add to pending approvals
    PendingApprovalService().addRequest(request);

    setState(() {
      _isSubmitting = false;
    });

    if (mounted) {
      // Show success and navigate to pending screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PendingApprovalScreen(request: request),
        ),
      );
    }
  }
}
