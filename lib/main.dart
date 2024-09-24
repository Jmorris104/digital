import 'package:flutter/material.dart';
import 'dart:math'; // For generating random numbers

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();
  
  // Variables to store simulated weather data
  String cityName = '';
  String temperature = '';
  String weatherCondition = '';

  // List of possible weather conditions
  final List<String> _weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];

  // Function to simulate fetching weather data
  void _fetchWeather() {
    setState(() {
      // Get the entered city name
      cityName = _cityController.text;

      // Generate a random temperature between 15°C and 30°C
      Random random = Random();
      int temp = 15 + random.nextInt(16);
      temperature = '$temp°C';

      // Randomly select a weather condition
      weatherCondition = _weatherConditions[random.nextInt(_weatherConditions.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _fetchWeather,
                child: Text('Fetch Weather'),
              ),
            ),
            SizedBox(height: 40),
            // Weather data display
            if (cityName.isNotEmpty) ...[
              Text(
                'City: $cityName',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Temperature: $temperature',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Condition: $weatherCondition',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}
