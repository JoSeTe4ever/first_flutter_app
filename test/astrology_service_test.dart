import 'package:first_app/core/services/astrology-service.dart';
import 'package:first_app/domain/entities/birth_card_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AstrologyService', () {
    test('getBirthCard returns a valid response', () async {
      final astrologyService = AstrologyService();

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
        final response = await astrologyService.getBirthCard(request.toJson());
        expect(response['status'], 'OK');
        print(response);
      } catch (e) {
        fail('Failed to load birth card: $e');
      }
    });
  });
}