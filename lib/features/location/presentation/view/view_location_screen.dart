import 'package:flutter/material.dart';

class ViewLocationScreen extends StatefulWidget {
  const ViewLocationScreen({super.key});

  @override
  State<ViewLocationScreen> createState() => _ViewLocationScreenState();
}

class _ViewLocationScreenState extends State<ViewLocationScreen> {
  bool _isInit = true;

  String? stateName;
  String? countryName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      countryName = args?['countryName'] ?? '';
      stateName = args?['stateName'] ?? '';
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Selected Location')),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Country: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    Text('$countryName', style: TextStyle(fontSize: 17)),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text('State: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    Text('$stateName', style: TextStyle(fontSize: 17)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
