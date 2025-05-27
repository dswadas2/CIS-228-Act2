import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Value Widgets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ValueWidgetsDemo(),
    );
  }
}

class ValueWidgetsDemo extends StatefulWidget {
  @override
  _ValueWidgetsDemoState createState() => _ValueWidgetsDemoState();
}

class _ValueWidgetsDemoState extends State<ValueWidgetsDemo> {
  // Controllers and variables for managing widget states
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  
  double _sliderValue = 50.0;
  bool _isChecked = false;
  bool _isNotificationsEnabled = true;
  bool _isLocationEnabled = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Value Widgets Demo'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField Widgets Section
            Text(
              '1. TextField Widgets',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 16),
            
            // Name TextField with various properties
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.edit),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixText: 'Mr/Ms. ',
              ),
            ),
            SizedBox(height: 16),
            
            // Email TextField
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.alternate_email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixText: '@company.com',
              ),
            ),
            SizedBox(height: 16),
            
            // Phone TextField with error handling
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                icon: Icon(Icons.phone),
                prefixText: '+1 ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                errorText: _phoneController.text.isNotEmpty && 
                          _phoneController.text.length < 10 
                    ? 'Phone number must be at least 10 digits' 
                    : null,
              ),
              onChanged: (value) {
                setState(() {}); // Trigger rebuild for error validation
              },
            ),
            
            SizedBox(height: 32),
            
            // Slider Widget Section
            Text(
              '2. Slider Widget',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 16),
            
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Volume Level: ${_sliderValue.round()}%',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 100,
                      divisions: 20,
                      label: '${_sliderValue.round()}%',
                      activeColor: Colors.blue[600],
                      inactiveColor: Colors.blue[200],
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('0%', style: TextStyle(color: Colors.grey)),
                        Text('100%', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 32),
            
            // Checkbox Widget Section
            Text(
              '3. Checkbox Widgets',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 16),
            
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Simple Checkbox
                    CheckboxListTile(
                      title: Text('I agree to the Terms and Conditions'),
                      subtitle: Text('Required to proceed'),
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      activeColor: Colors.blue[600],
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    
                    Divider(),
                    
                    // Notifications Checkbox
                    CheckboxListTile(
                      title: Text('Enable Notifications'),
                      subtitle: Text('Receive updates and alerts'),
                      value: _isNotificationsEnabled,
                      onChanged: (bool? value) {
                        setState(() {
                          _isNotificationsEnabled = value ?? false;
                        });
                      },
                      activeColor: Colors.green[600],
                      secondary: Icon(Icons.notifications),
                    ),
                    
                    // Location Services Checkbox
                    CheckboxListTile(
                      title: Text('Enable Location Services'),
                      subtitle: Text('Allow app to access your location'),
                      value: _isLocationEnabled,
                      onChanged: (bool? value) {
                        setState(() {
                          _isLocationEnabled = value ?? false;
                        });
                      },
                      activeColor: Colors.orange[600],
                      secondary: Icon(Icons.location_on),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 32),
            
            // Summary Section
            Card(
              elevation: 4,
              color: Colors.blue[50],
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Values Summary:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Name: ${_nameController.text.isEmpty ? "Not entered" : _nameController.text}'),
                    Text('Email: ${_emailController.text.isEmpty ? "Not entered" : _emailController.text}'),
                    Text('Phone: ${_phoneController.text.isEmpty ? "Not entered" : _phoneController.text}'),
                    Text('Volume: ${_sliderValue.round()}%'),
                    Text('Terms Agreed: ${_isChecked ? "Yes" : "No"}'),
                    Text('Notifications: ${_isNotificationsEnabled ? "Enabled" : "Disabled"}'),
                    Text('Location: ${_isLocationEnabled ? "Enabled" : "Disabled"}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}