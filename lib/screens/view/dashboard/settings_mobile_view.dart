import 'package:flutter/material.dart';

class SettingsMobileView extends StatefulWidget {
  const SettingsMobileView({super.key});

  @override
  State<SettingsMobileView> createState() => _SettingsMobileViewState();
}

class _SettingsMobileViewState extends State<SettingsMobileView> {
  int _selectedTab = 0;
  String _colorTheme = 'Light';
  String _timezone = 'Default';
  String _currency = 'USD';

  final List<String> _tabs = [
    'General Settings',
    'Account Settings',
    'Notifications Settings',
    'Security Settings',
    'Payment & Billing Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTabNavigation(),
              SizedBox(height: 20),
              Expanded(child: _buildContentCard()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabNavigation() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _tabs.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedTab == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTab = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
              child: Center(
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelected ? Colors.black : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContentCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(child: _buildSettingsContent()),
    );
  }

  Widget _buildSettingsContent() {
    switch (_selectedTab) {
      case 0:
        return _buildGeneralSettings();
      default:
        return Center(
          child: Text(
            _tabs[_selectedTab],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
    }
  }

  Widget _buildGeneralSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: _buildLogoUpload()),
        const SizedBox(height: 24),
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
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings saved successfully')),
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
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
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
        width: 140,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 36, color: Colors.black87),
            SizedBox(height: 8),
            Text(
              'Logo Upload',
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Compact dropdown version (no extra height)
  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> options,
    required Function(String) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
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
          const SizedBox(width: 8),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isDense: true, // 🔹 reduces vertical padding
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey.shade600,
                size: 18,
              ),
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              items: options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option, style: const TextStyle(fontSize: 14)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) onChanged(newValue);
              },
            ),
          ),
        ],
      ),
    );
  }
}
