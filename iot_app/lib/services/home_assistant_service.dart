import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/ha_entity.dart';

class HomeAssistantService {
  final String? _baseUrl = dotenv.env['HA_URL'];
  final String? _token = dotenv.env['HA_TOKEN'];

  Future<List<HAEntity>> getEntities() async {
    if (_baseUrl == null || _token == null) {
      throw Exception('Falta HA_URL o HA_TOKEN en el archivo .env');
    }

    final url = Uri.parse('$_baseUrl/api/states');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => HAEntity.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar entidades: ${response.statusCode}');
    }
  }

  Future<List<HAEntity>> getRelevantDevices() async {
    final entities = await getEntities();
    
    // Filtrar dominios comunes para dispositivos Tuya / Controladores de AC
    return entities.where((e) {
      return e.entityId.startsWith('climate.') || 
             e.entityId.startsWith('remote.') || 
             e.entityId.startsWith('switch.') ||
             e.entityId.startsWith('sensor.') && e.entityId.contains('temperature'); // Por si hay sensores
    }).toList();
  }
}
