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

  Future<List<HAEntity>> getRelevantDevices({String? buildingFilter}) async {
    final entities = await getEntities();
    
    // Filtrar dominios comunes para dispositivos Tuya / Controladores de AC
    return entities.where((e) {
      final isRelevant = e.entityId.startsWith('climate.') || 
             e.entityId.startsWith('remote.') || 
             e.entityId.startsWith('switch.') ||
             (e.entityId.startsWith('sensor.') && e.entityId.contains('temperature'));
             
      if (!isRelevant) return false;

      if (buildingFilter != null) {
        // Usa un límite de palabra (\b) para evitar coincidencias erróneas (ej. 'h' en 'switch')
        // Coincidirá con "H1", "Salón H1", "climate.h1", "h2", etc.
        final regex = RegExp('\\b$buildingFilter', caseSensitive: false);
        return regex.hasMatch(e.friendlyName) || regex.hasMatch(e.entityId);
      }

      return true;
    }).toList();
  }
}
