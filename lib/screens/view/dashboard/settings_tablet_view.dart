import 'package:flutter/material.dart';

class SettingsTabletView extends StatefulWidget {
  const SettingsTabletView({super.key});

  @override
  State<SettingsTabletView> createState() => _SettingsTabletViewState();
}

class _SettingsTabletViewState extends State<SettingsTabletView> {
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab Navigation
            _buildTabNavigation(),
            const SizedBox(height: 20),
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(_tabs.length, (index) {
            final isSelected = _selectedTab == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
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
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelected ? Colors.black : Colors.black87,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildContentCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
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
      default:
        return Center(
          child: Text(
            _tabs[_selectedTab],
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
            _buildLogoUpload(),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                children: [
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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Settings saved successfully')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffED1C24),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
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
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add, size: 40, color: Colors.black87),
            SizedBox(height: 8),
            Text(
              'Logo Upload',
              style: TextStyle(fontSize: 13, color: Colors.black87),
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
          Expanded(
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
        ],
      ),
    );
  }
}
