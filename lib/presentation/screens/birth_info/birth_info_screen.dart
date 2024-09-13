import 'package:flutter/material.dart';

import '../../../core/services/astrology-service.dart';
import '../../../domain/entities/birth_card_request.dart';
import '../../widgets/birth/birth_chart.dart';

class BirthInfoScreen extends StatefulWidget {
  const BirthInfoScreen({super.key});

  @override
  State<BirthInfoScreen> createState() => _BirthInfoScreenState();
}

class _BirthInfoScreenState extends State<BirthInfoScreen> {
  final AstrologyService _astrologyService = AstrologyService();
  String? _svgData;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchBirthCard();
  }

  Future<void> _fetchBirthCard() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    final subject = Subject(
      year: 1980,
      month: 12,
      day: 12,
      hour: 12,
      minute: 12,
      longitude: 0.0,
      latitude: 51.4825766,
      city: 'London',
      nation: 'GB',
      timezone: 'Europe/London',
      name: 'John Doe',
      zodiacType: 'Tropic',
      siderealMode: null,
    );
    final request = BirthCardRequest(
      subject: subject,
      theme: 'classic',
      language: 'EN',
    );
    try {
      final response = await _astrologyService.getBirthCard(request.toJson());
      setState(() {
        _svgData = response['chart'];

        RegExp regex = RegExp(r"<svg.*?>([\s\S]*?)<\/svg>");
        Match? match = regex.firstMatch(_svgData!);

        if (match != null) {
          _svgData = match.group(0) ?? "";
        }

        _isLoading = false;

      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load birth card: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birth Info'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _errorMessage != null
                ? Text(_errorMessage!)
                : _svgData != null
                    ? BirthChart(svgData: _svgData!)
                    : Text('No data available'),
      ),
    );
  }
}
