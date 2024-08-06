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

let testDepartamentos: Data = """
    [{"nombre": "AMAZONAS", "id": "91"}, {"nombre": "ANTIOQUIA", "id": "5"}, {"nombre": "ARAUCA", "id": "81"}, {"nombre": "ARCHIPIÉLAGO DE SAN ANDRES, PROVIDENCIA Y SANTA CATALINA", "id": "88"}, {"nombre": "ATLÁNTICO", "id": "8"}, {"nombre": "BOGOTÁ  D. C.", "id": "11"}, {"nombre": "BOLÍVAR", "id": "13"}, {"nombre": "BOYACÁ", "id": "15"}, {"nombre": "CALDAS", "id": "17"}, {"nombre": "CAQUETÁ", "id": "18"}, {"nombre": "CASANARE", "id": "85"}, {"nombre": "CAUCA", "id": "19"}, {"nombre": "CESAR", "id": "20"}, {"nombre": "CHOCÓ", "id": "27"}, {"nombre": "CORDOBA", "id": "23"}, {"nombre": "CUNDINAMARCA", "id": "25"}, {"nombre": "GUAINÍA", "id": "94"}, {"nombre": "GUAVIARE", "id": "95"}, {"nombre": "HUILA", "id": "41"}, {"nombre": "LA GUAJIRA", "id": "44"}, {"nombre": "MAGDALENA", "id": "47"}, {"nombre": "META", "id": "50"}, {"nombre": "NARIÑO", "id": "52"}, {"nombre": "NORTE DE SANTANDER", "id": "54"}, {"nombre": "PUTUMAYO", "id": "86"}, {"nombre": "QUINDÍO", "id": "63"}, {"nombre": "RISARALDA", "id": "66"}, {"nombre": "SANTANDER", "id": "68"}, {"nombre": "SUCRE", "id": "70"}, {"nombre": "TOLIMA", "id": "73"}, {"nombre": "VALLE DEL CAUCA", "id": "76"}, {"nombre": "VAUPÉS", "id": "97"}, {"nombre": "VICHADA", "id": "99"}]
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

let testQuakesByPlaces: Data = """
    [
        {
            "FECHA_LONG": 1712099760000,
            "NOMBRE_MUNICIPIO": "AGUAZUL",
            "FECHA": "02/04/2024 - 06:16 PM",
            "I": "3",
            "PROFUNDIDAD": "16",
            "NOMBRE_CENTRO_POBLADO": "AGUAZUL",
            "MAGNITUD": 4.8,
            "ID_CENTRO_POBLADO": 85010000,
            "FECHA_2": "2024/04/02 - 06:16 PM",
            "ID_SISMO": "SGC2024gorcrq",
            "INT_MAX": "5",
            "LONGITUD": "-72.39",
            "NOMBRE": "CASANARE",
            "LATITUD": "5.50",
            "EPICENTRO": "Yopal - Casanare, Colombia"
        },
        {
            "FECHA_LONG": 1634014260000,
            "NOMBRE_MUNICIPIO": "AGUAZUL",
            "FECHA": "11/10/2021 - 11:51 PM",
            "I": "3",
            "PROFUNDIDAD": "158",
            "NOMBRE_CENTRO_POBLADO": "AGUAZUL",
            "MAGNITUD": 5.1,
            "ID_CENTRO_POBLADO": 85010000,
            "FECHA_2": "2021/10/11 - 11:51 PM",
            "ID_SISMO": "SGC2021ubrxfm",
            "INT_MAX": "5",
            "LONGITUD": "-73.20",
            "NOMBRE": "CASANARE",
            "LATITUD": "6.82",
            "EPICENTRO": "Zapatoca - Santander, Colombia"
        },
        {
            "FECHA_LONG": 1591234320000,
            "NOMBRE_MUNICIPIO": "AGUAZUL",
            "FECHA": "03/06/2020 - 08:32 PM",
            "I": "2",
            "PROFUNDIDAD": "22",
            "NOMBRE_CENTRO_POBLADO": "AGUAZUL",
            "MAGNITUD": 3.9,
            "ID_CENTRO_POBLADO": 85010000,
            "FECHA_2": "2020/06/03 - 08:32 PM",
            "ID_SISMO": "SGC2020kyqqiw",
            "INT_MAX": "5",
            "LONGITUD": "-72.33",
            "NOMBRE": "CASANARE",
            "LATITUD": "5.40",
            "EPICENTRO": "Yopal - Casanare, Colombia"
        },
        {
            "FECHA_LONG": 1587871740000,
            "NOMBRE_MUNICIPIO": "AGUAZUL",
            "FECHA": "25/04/2020 - 10:29 PM",
            "I": "2",
            "PROFUNDIDAD": "52",
            "NOMBRE_CENTRO_POBLADO": "AGUAZUL",
            "MAGNITUD": 4.1,
            "ID_CENTRO_POBLADO": 85010000,
            "FECHA_2": "2020/04/25 - 10:29 PM",
            "ID_SISMO": "SGC2020iffesg",
            "INT_MAX": "5",
            "LONGITUD": "-73.00",
            "NOMBRE": "CASANARE",
            "LATITUD": "4.89",
            "EPICENTRO": "Sabanalarga - Casanare, Colombia"
        },
        {
            "FECHA_LONG": 1587828600000,
            "NOMBRE_MUNICIPIO": "AGUAZUL",
            "FECHA": "25/04/2020 - 10:30 AM",
            "I": "4",
            "PROFUNDIDAD": "16",
            "NOMBRE_CENTRO_POBLADO": "AGUAZUL",
            "MAGNITUD": 4.6,
            "ID_CENTRO_POBLADO": 85010000,
            "FECHA_2": "2020/04/25 - 10:30 AM",
            "ID_SISMO": "SGC2020iehjld",
            "INT_MAX": "4",
            "LONGITUD": "-72.86",
            "NOMBRE": "CASANARE",
            "LATITUD": "5.00",
            "EPICENTRO": "Monterrey - Casanare, Colombia"
        },
        {
            "FECHA_LONG": 1586230140000,
            "NOMBRE_MUNICIPIO": "AGUAZUL",
            "FECHA": "06/04/2020 - 10:29 PM",
            "I": "2",
            "PROFUNDIDAD": "147",
            "NOMBRE_CENTRO_POBLADO": "AGUAZUL",
            "MAGNITUD": 4.3,
            "ID_CENTRO_POBLADO": 85010000,
            "FECHA_2": "2020/04/06 - 10:29 PM",
            "ID_SISMO": "SGC2020gwiavf",
            "INT_MAX": "5",
            "LONGITUD": "-73.16",
            "NOMBRE": "CASANARE",
            "LATITUD": "6.79",
            "EPICENTRO": "Los Santos - Santander, Colombia"
        },
        {
            "FECHA_LONG": 1585418100000,
            "NOMBRE_MUNICIPIO": "AGUAZUL",
            "FECHA": "28/03/2020 - 12:55 AM",
            "I": "3",
            "PROFUNDIDAD": "149",
            "NOMBRE_CENTRO_POBLADO": "AGUAZUL",
            "MAGNITUD": 5.1,
            "ID_CENTRO_POBLADO": 85010000,
            "FECHA_2": "2020/03/28 - 00:55 PM",
            "ID_SISMO": "SGC2020gedyqj",
            "INT_MAX": "6",
            "LONGITUD": "-73.16",
            "NOMBRE": "CASANARE",
            "LATITUD": "6.81",
            "EPICENTRO": "Los Santos - Santander, Colombia"
        },
        {
            "FECHA_LONG": 1577218980000,
            "NOMBRE_MUNICIPIO": "AGUAZUL",
            "FECHA": "24/12/2019 - 03:23 PM",
            "I": "4",
            "PROFUNDIDAD": "-0",
            "NOMBRE_CENTRO_POBLADO": "AGUAZUL",
            "MAGNITUD": 4.1,
            "ID_CENTRO_POBLADO": 85010000,
            "FECHA_2": "2019/12/24 - 03:23 PM",
            "ID_SISMO": "SGC2019zgwumg",
            "INT_MAX": "6",
            "LONGITUD": "-74.19",
            "NOMBRE": "CASANARE",
            "LATITUD": "3.42",
            "EPICENTRO": "Mesetas - Meta, Colombia"
        },
        {
            "FECHA_LONG": 1577215140000,
            "NOMBRE_MUNICIPIO": "AGUAZUL",
            "FECHA": "24/12/2019 - 02:19 PM",
            "I": "2",
            "PROFUNDIDAD": "12",
            "NOMBRE_CENTRO_POBLADO": "AGUAZUL",
            "MAGNITUD": 5.8,
            "ID_CENTRO_POBLADO": 85010000,
            "FECHA_2": "2019/12/24 - 02:19 PM",
            "ID_SISMO": "SGC2019zgurak",
            "INT_MAX": "6",
            "LONGITUD": "-74.24",
            "NOMBRE": "CASANARE",
            "LATITUD": "3.47",
            "EPICENTRO": "Mesetas - Meta, Colombia"
        },
        {
            "FECHA_LONG": 1577214180000,
            "NOMBRE_MUNICIPIO": "AGUAZUL",
            "FECHA": "24/12/2019 - 02:03 PM",
            "I": "3",
            "PROFUNDIDAD": "9",
            "NOMBRE_CENTRO_POBLADO": "AGUAZUL",
            "MAGNITUD": 5.9,
            "ID_CENTRO_POBLADO": 85010000,
            "FECHA_2": "2019/12/24 - 02:03 PM",
            "ID_SISMO": "SGC2019zgudxj",
            "INT_MAX": "6",
            "LONGITUD": "-74.19",
            "NOMBRE": "CASANARE",
            "LATITUD": "3.45",
            "EPICENTRO": "Mesetas - Meta, Colombia"
        },
        {
            "FECHA_LONG": 1556339580000,
            "NOMBRE_MUNICIPIO": "AGUAZUL",
            "FECHA": "26/04/2019 - 11:33 PM",
            "I": "2",
            "PROFUNDIDAD": "0",
            "NOMBRE_CENTRO_POBLADO": "AGUAZUL",
            "MAGNITUD": 2.7,
            "ID_CENTRO_POBLADO": 85010000,
            "FECHA_2": "2019/04/26 - 11:33 PM",
            "ID_SISMO": "SGC2019ieioz",
            "INT_MAX": "3",
            "LONGITUD": "-72.54",
            "NOMBRE": "CASANARE",
            "LATITUD": "5.27",
            "EPICENTRO": "Aguazul - Casanare, Colombia"
        }
    ]
    """.data(using: .utf8)!


let testColombiaQuakesData: Data = """
    [
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
      },
      {
        "SITIO": "Cucunubá - Cundinamarca, Colombia",
        "MAGNITUD": 2.5,
        "TIME_VALUE": 1721799260,
        "ID_SISMO": "SGC2024omsyna",
        "FECHA": "24/07/2024 - 12:34 AM",
        "PROFUNDIDAD": 140,
        "ID": "SGC2024omsyna",
        "TIENE_INFOGRAFIA": 0,
        "LONGITUD": -73.73,
        "INICIADOR": "172.25.2.207-srv-siss7",
        "LATITUD": 5.26,
        "I_MAX": 2
      },
      {
        "SITIO": "Los Santos - Santander, Colombia",
        "MAGNITUD": 2.7,
        "TIME_VALUE": 1721795070,
        "ID_SISMO": "SGC2024omqqjr",
        "FECHA": "23/07/2024 - 11:24 PM",
        "PROFUNDIDAD": 144,
        "ID": "SGC2024omqqjr",
        "TIENE_INFOGRAFIA": 0,
        "LONGITUD": -73.19,
        "INICIADOR": "172.25.2.207-srv-siss7",
        "LATITUD": 6.8,
        "I_MAX": 2
      },
      {
        "SITIO": "Los Santos - Santander, Colombia",
        "MAGNITUD": 2.8,
        "TIME_VALUE": 1721734387,
        "ID_SISMO": "SGC2024oljcvj",
        "FECHA": "23/07/2024 - 06:33 AM",
        "PROFUNDIDAD": 144,
        "ID": "SGC2024oljcvj",
        "TIENE_INFOGRAFIA": 0,
        "LONGITUD": -73.1,
        "INICIADOR": "172.25.2.207-srv-siss7",
        "LATITUD": 6.79,
        "I_MAX": 2
      },
      {
        "SITIO": "Los Santos - Santander, Colombia",
        "MAGNITUD": 2.2,
        "TIME_VALUE": 1721556091,
        "ID_SISMO": "SGC2024ohoqcy",
        "FECHA": "21/07/2024 - 05:01 AM",
        "PROFUNDIDAD": 140,
        "ID": "SGC2024ohoqcy",
        "TIENE_INFOGRAFIA": 0,
        "LONGITUD": -73.1,
        "INICIADOR": "172.25.2.207-srv-siss7",
        "LATITUD": 6.78,
        "I_MAX": 2
      },
      {
        "SITIO": "Los Santos - Santander, Colombia",
        "MAGNITUD": 2.6,
        "TIME_VALUE": 1721535507,
        "ID_SISMO": "SGC2024ohdgnk",
        "FECHA": "20/07/2024 - 11:18 PM",
        "PROFUNDIDAD": 141,
        "ID": "SGC2024ohdgnk",
        "TIENE_INFOGRAFIA": 0,
        "LONGITUD": -73.18,
        "INICIADOR": "172.25.2.207-srv-siss7",
        "LATITUD": 6.78,
        "I_MAX": 3
      },
      {
        "SITIO": "Lenguazaque - Cundinamarca, Colombia",
        "MAGNITUD": 2.1,
        "TIME_VALUE": 1721455413,
        "ID_SISMO": "SGC2024ofkzrs",
        "FECHA": "20/07/2024 - 01:03 AM",
        "PROFUNDIDAD": 138,
        "ID": "SGC2024ofkzrs",
        "TIENE_INFOGRAFIA": 0,
        "LONGITUD": -73.7,
        "INICIADOR": "172.25.2.207-srv-siss7",
        "LATITUD": 5.25,
        "I_MAX": 3
      },
      {
        "SITIO": "Mesetas - Meta, Colombia",
        "MAGNITUD": 2.6,
        "TIME_VALUE": 1721422462,
        "ID_SISMO": "SGC2024oesuyr",
        "FECHA": "19/07/2024 - 03:54 PM",
        "PROFUNDIDAD": 14,
        "ID": "SGC2024oesuyr",
        "TIENE_INFOGRAFIA": 0,
        "LONGITUD": -74.21,
        "INICIADOR": "172.25.2.207-srv-siss7",
        "LATITUD": 3.49,
        "I_MAX": 2
      },
      {
        "SITIO": "Los Santos - Santander, Colombia",
        "MAGNITUD": 2.4,
        "TIME_VALUE": 1721394640,
        "ID_SISMO": "SGC2024oedljv",
        "FECHA": "19/07/2024 - 08:10 AM",
        "PROFUNDIDAD": 148,
        "ID": "SGC2024oedljv",
        "TIENE_INFOGRAFIA": 0,
        "LONGITUD": -73.18,
        "INICIADOR": "172.25.2.207-srv-siss7",
        "LATITUD": 6.78,
        "I_MAX": 2
      },
      {
        "SITIO": "Toribío - Cauca, Colombia",
        "MAGNITUD": 3.4,
        "TIME_VALUE": 1721332747,
        "ID_SISMO": "OVSPOP2058354",
        "FECHA": "18/07/2024 - 02:59 PM",
        "PROFUNDIDAD": 6,
        "ID": "OVSPOP2058354",
        "TIENE_INFOGRAFIA": 0,
        "LONGITUD": -76.11,
        "INICIADOR": "172.25.2.207-srv-siss7",
        "LATITUD": 2.83,
        "I_MAX": 2
      }
    ]
    """.data(using: .utf8)!
