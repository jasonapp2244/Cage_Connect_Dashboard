import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class SettingsWebView extends StatefulWidget {
  const SettingsWebView({super.key});

  @override
  State<SettingsWebView> createState() => _SettingsWebViewState();
}

class _SettingsWebViewState extends State<SettingsWebView> {
  int _selectedTab = 0;
  String _colorTheme = 'Light';
  String _timezone = 'Default';
  String _currency = 'USD';
  String _emailNotifications = 'On';
  String _inAppNotifications = 'Off';
  String _smsAlerts = 'On';
  String _newUserSignupAlerts = 'Off';
  String _newPaymentAlerts = 'On';
  String _supportTicketAlerts = 'Off';
  String _twoFactorAuth = 'On';
  final TextEditingController _adminNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final List<String> _tabs = [
    'General Settings',
    'Account Settings',
    'Notifications Settings',
    'Security Settings',
    'Payment & Billing Settings',
  ];

  @override
  void dispose() {
    _adminNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab Navigation
            _buildTabNavigation(),
            const SizedBox(height: 24),
            // Main Content Card
            Expanded(child: _buildContentCard()),
          ],
        ),
      ),
    );
  }

  Widget _buildTabNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          final isSelected = _selectedTab == index;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected
                          ? const Color(0xffED1C24)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  _tabs[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelected ? Colors.black : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildContentCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _buildSettingsContent(),
    );
  }

  Widget _buildSettingsContent() {
    switch (_selectedTab) {
      case 0:
        return _buildGeneralSettings();
      case 1:
        return _buildAccountSettings();
      case 2:
        return _buildNotificationsSettings();
      case 3:
        return _buildSecuritySettings();
      case 4:
        return _buildPaymentSettings();
      default:
        return Center(
          child: Text(
            _tabs[_selectedTab],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
    }
  }

  Widget _buildGeneralSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo Upload Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildLogoUpload(),
                  const SizedBox(height: 16),
                  _buildDropdownField(
                    label: 'Color Theme',
                    value: _colorTheme,
                    options: ['Light', 'Dark', 'System'],
                    onChanged: (value) {
                      setState(() {
                        _colorTheme = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildDropdownField(
                    label: 'Timezone',
                    value: _timezone,
                    options: ['Default', 'UTC', 'EST', 'PST', 'GMT'],
                    onChanged: (value) {
                      setState(() {
                        _timezone = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildDropdownField(
                    label: 'Currency',
                    value: _currency,
                    options: ['USD', 'EUR', 'GBP', 'CAD', 'AUD'],
                    onChanged: (value) {
                      setState(() {
                        _currency = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Save Button
        ElevatedButton(
          onPressed: () {
            // Handle save action
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Settings saved successfully')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffED1C24),
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Save',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogoUpload() {
    return GestureDetector(
      onTap: () {
        // Handle logo upload
      },
      child: Container(
        width: 180,
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add, size: 48, color: Colors.black87),
            SizedBox(height: 8),
            Text(
              'Logo Upload',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> options,
    required Function(String) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),

          SizedBox(
            height: 20,
            child: Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    isExpanded: false,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey.shade600,
                    ),
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                    items: options.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        onChanged(newValue);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Picture Upload Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildProfilePictureUpload(),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _adminNameController,
                    label: 'Admin Name',
                    hintText: 'Admin name',
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email Address',
                    hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _phoneController,
                    label: 'Phone Number',
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Save Button
        ElevatedButton(
          onPressed: () {
            // Handle save action
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Account settings saved successfully'),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffED1C24),
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Save',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfilePictureUpload() {
    return GestureDetector(
      onTap: () {
        // Handle profile picture upload
      },
      child: Container(
        width: 180,
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add, size: 48, color: Colors.black87),
            SizedBox(height: 8),
            Text(
              'Profile Picture',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
            filled: true,
            fillColor: const Color(0xFFF0F0F0),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffED1C24), width: 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationsSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildNotificationToggle(
          label: 'Email Notifications',
          value: _emailNotifications,
          onChanged: (value) {
            setState(() {
              _emailNotifications = value;
            });
          },
        ),
        const SizedBox(height: 16),
        _buildNotificationToggle(
          label: 'In-App Notifications',
          value: _inAppNotifications,
          onChanged: (value) {
            setState(() {
              _inAppNotifications = value;
            });
          },
        ),
        const SizedBox(height: 16),
        _buildNotificationToggle(
          label: 'SMS Alerts',
          value: _smsAlerts,
          onChanged: (value) {
            setState(() {
              _smsAlerts = value;
            });
          },
        ),
        const SizedBox(height: 16),
        _buildNotificationToggle(
          label: 'New User Signup Alerts',
          value: _newUserSignupAlerts,
          onChanged: (value) {
            setState(() {
              _newUserSignupAlerts = value;
            });
          },
        ),
        const SizedBox(height: 16),
        _buildNotificationToggle(
          label: 'New Payment Alerts',
          value: _newPaymentAlerts,
          onChanged: (value) {
            setState(() {
              _newPaymentAlerts = value;
            });
          },
        ),
        const SizedBox(height: 16),
        _buildNotificationToggle(
          label: 'Support Ticket Alerts',
          value: _supportTicketAlerts,
          onChanged: (value) {
            setState(() {
              _supportTicketAlerts = value;
            });
          },
        ),
        const SizedBox(height: 32),
        // Save Button
        ElevatedButton(
          onPressed: () {
            // Handle save action
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Notifications settings saved successfully'),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffED1C24),
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Save',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationToggle({
    required String label,
    required String value,
    required Function(String) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 20,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: false,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey.shade600,
                ),
                style: const TextStyle(fontSize: 14, color: Colors.black87),
                items: const [
                  DropdownMenuItem<String>(value: 'On', child: Text('On')),
                  DropdownMenuItem<String>(value: 'Off', child: Text('Off')),
                ],
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    onChanged(newValue);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecuritySettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Two-Factor Authentication
        _buildNotificationToggle(
          label: 'Two-Factor Authentication (2FA)',
          value: _twoFactorAuth,
          onChanged: (value) {
            setState(() {
              _twoFactorAuth = value;
            });
          },
        ),
        const SizedBox(height: 16),
        // Reset Password Link
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Reset password?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle reset password
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Password reset link sent to your email'),
                    ),
                  );
                },
                child: const Text(
                  'Click Here',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffED1C24),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Active Sessions
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Active Sessions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              _buildSessionItem(
                device: 'Google Pixel 7 Pro',
                location: 'Karachi, Pakistan',
                time: 'Today at 7:27 PM',
              ),
              const SizedBox(height: 16),
              _buildSessionItem(
                device: 'Windows PC',
                location: 'Karachi, Pakistan',
                time: 'Today at 7:27 PM',
              ),
              const SizedBox(height: 16),
              _buildSessionItem(
                device: 'Google Pixel 7 Pro',
                location: 'Karachi, Pakistan',
                time: 'Today at 7:27 PM',
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle logout from all devices
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Logged out from all devices'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffED1C24),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Logout from all devices',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSessionItem({
    required String device,
    required String location,
    required String time,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                device,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                location,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              Text(
                time,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentSettings() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Payment Gateways Connected Card
        Container(
          width: 450,
          height: 280,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Payment Gateways Connected',
                style: TextStyle(fontSize: 18, color: Color(0xff6C6C6C)),
              ),
              const SizedBox(height: 24),
              _buildPaymentGatewayItem(name: 'Stripe', buttonText: 'Connect'),
              const SizedBox(height: 16),
              _buildPaymentGatewayItem(name: 'PayPal', buttonText: 'Connect'),
              const SizedBox(height: 16),
              _buildPaymentGatewayItem(
                name: 'Bank Transfer',
                buttonText: 'Setup',
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildPaymentGatewayItem({
    required String name,
    required String buttonText,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            buttonText,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
