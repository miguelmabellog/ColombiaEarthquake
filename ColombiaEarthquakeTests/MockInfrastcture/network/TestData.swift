//
//  TestData.swift
//  ColombiaEarthquakeTests
//
//  Created by miguel angel bello garcia on 20/07/24.
//

import Foundation

let testFeature_nc73649170: Data = """
    {
      "SITIO": "El Carmen - Santander, Colombia",
      "MAGNITUD": 2.5,
      "TIME_VALUE": 1721827899,
      "ID_SISMO": "SGC2024onitvr",
      "FECHA": "24/07/2024 - 08:31 AM",
      "PROFUNDIDAD": 115,
      "ID": "SGC2024onitvr",
      "TIENE_INFOGRAFIA": 0,
      "LONGITUD": -73.53,
      "INICIADOR": "172.25.2.207-srv-siss7",
      "LATITUD": 6.55,
      "I_MAX": 2
    }
    """.data(using: .utf8)!



let testDepartamentoModel: Data = """
    {"nombre": "AMAZONAS", "id": "91"}
    """.data(using: .utf8)!

let testMunicipios: Data = """
    [{"nombre": "BARANOA", "id": "8078"}, {"nombre": "BARRANQUILLA", "id": "8001"}, {"nombre": "CAMPO DE LA CRUZ", "id": "8137"}, {"nombre": "CANDELARIA", "id": "8141"}, {"nombre": "GALAPA", "id": "8296"}, {"nombre": "JUAN DE ACOSTA", "id": "8372"}, {"nombre": "LURUACO", "id": "8421"}, {"nombre": "MALAMBO", "id": "8433"}, {"nombre": "MANATÍ", "id": "8436"}, {"nombre": "PALMAR DE VARELA", "id": "8520"}, {"nombre": "PIOJÓ", "id": "8549"}, {"nombre": "POLONUEVO", "id": "8558"}, {"nombre": "PONEDERA", "id": "8560"}, {"nombre": "PUERTO COLOMBIA", "id": "8573"}, {"nombre": "REPELÓN", "id": "8606"}, {"nombre": "SABANAGRANDE", "id": "8634"}, {"nombre": "SABANALARGA", "id": "8638"}, {"nombre": "SANTA LUCÍA", "id": "8675"}, {"nombre": "SANTO TOMÁS", "id": "8685"}, {"nombre": "SOLEDAD", "id": "8758"}, {"nombre": "SUAN", "id": "8770"}, {"nombre": "TUBARÁ", "id": "8832"}, {"nombre": "USIACURÍ", "id": "8849"}]
    """.data(using: .utf8)!

let testMunicipioModel: Data = """
    {"nombre": "BARANOA", "id": "8078"}
    """.data(using: .utf8)!

let testCentrosPoblados: Data = """
    [{"nombre": "AGUAZUL", "id": "85010000", "tipo": "1"}, {"nombre": "ATALAYAS", "id": "85010016", "tipo": "null"}, {"nombre": "CUPIAGUA", "id": "85010001", "tipo": "null"}, {"nombre": "LLANO LINDO", "id": "85010014", "tipo": "null"}, {"nombre": "MONTERRALO", "id": "85010002", "tipo": "null"}, {"nombre": "PLAN BRISAS", "id": "85010015", "tipo": "null"}, {"nombre": "PUENTE CUSIANA", "id": "85010010", "tipo": "null"}, {"nombre": "SAN BENITO", "id": "85010003", "tipo": "null"}, {"nombre": "SAN JOSÉ", "id": "85010005", "tipo": "null"}, {"nombre": "UNETE", "id": "85010006", "tipo": "null"}]
    """.data(using: .utf8)!

let testCentroPobladoModel: Data = """
    {"nombre": "BARRANQUILLA", "id": "8001000", "tipo": "1"}
    """.data(using: .utf8)!

let testQuakeByPlaceModel: Data = """
    {
        "FECHA_LONG": 1722376560000,
                "NOMBRE_MUNICIPIO": "BOGOTÁ, D.C.",
                "FECHA": "30/07/2024 - 04:56 PM",
                "I": "2",
                "PROFUNDIDAD": "149",
                "NOMBRE_CENTRO_POBLADO": "BOGOTÁ, DISTRITO CAPITAL",
                "MAGNITUD": 3.3,
                "ID_CENTRO_POBLADO": 11001000,
                "FECHA_2": "2024/07/30 - 04:56 PM",
                "ID_SISMO": "SGC2024oyzvpl",
                "INT_MAX": "2",
                "LONGITUD": "-73.70",
                "NOMBRE": "BOGOTÁ  D. C.",
                "LATITUD": "5.23",
                "EPICENTRO": "Cucunubá - Cundinamarca, Colombia"
    }
    """.data(using: .utf8)!





