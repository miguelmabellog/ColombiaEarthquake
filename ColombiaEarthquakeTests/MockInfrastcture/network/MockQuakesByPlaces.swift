//
//  MockQuakesByPlaces.swift
//  ColombiaEarthquakeTests
//
//  Created by miguel angel bello garcia on 13/08/24.
//

import Foundation

let mockQuakesByPlaces: Data = """
    [
        {
            "FECHA_LONG": 1723448400000,
            "NOMBRE_MUNICIPIO": "BOGOTÁ, D.C.",
            "FECHA": "12/08/2024 - 02:40 AM",
            "I": "3",
            "PROFUNDIDAD": "141",
            "NOMBRE_CENTRO_POBLADO": "BOGOTÁ, DISTRITO CAPITAL",
            "MAGNITUD": 2.9,
            "ID_CENTRO_POBLADO": 11001000,
            "FECHA_2": "2024/08/12 - 02:40 AM",
            "ID_SISMO": "SGC2024pvtyjw",
            "INT_MAX": "3",
            "LONGITUD": "-73.16",
            "NOMBRE": "BOGOTÁ  D. C.",
            "LATITUD": "6.76",
            "EPICENTRO": "Los Santos - Santander, Colombia"
        },
        {
            "FECHA_LONG": 1722992640000,
            "NOMBRE_MUNICIPIO": "BOGOTÁ, D.C.",
            "FECHA": "06/08/2024 - 08:04 PM",
            "I": "2",
            "PROFUNDIDAD": "147",
            "NOMBRE_CENTRO_POBLADO": "BOGOTÁ, DISTRITO CAPITAL",
            "MAGNITUD": 3.5,
            "ID_CENTRO_POBLADO": 11001000,
            "FECHA_2": "2024/08/06 - 08:04 PM",
            "ID_SISMO": "SGC2024pmcemb",
            "INT_MAX": "2",
            "LONGITUD": "-73.21",
            "NOMBRE": "BOGOTÁ  D. C.",
            "LATITUD": "6.77",
            "EPICENTRO": "Villanueva - Santander, Colombia"
        },
        {
            "FECHA_LONG": 1722947760000,
            "NOMBRE_MUNICIPIO": "BOGOTÁ, D.C.",
            "FECHA": "06/08/2024 - 07:36 AM",
            "I": "3",
            "PROFUNDIDAD": "141",
            "NOMBRE_CENTRO_POBLADO": "BOGOTÁ, DISTRITO CAPITAL",
            "MAGNITUD": 2.7,
            "ID_CENTRO_POBLADO": 11001000,
            "FECHA_2": "2024/08/06 - 07:36 AM",
            "ID_SISMO": "SGC2024pldkeh",
            "INT_MAX": "3",
            "LONGITUD": "-73.12",
            "NOMBRE": "BOGOTÁ  D. C.",
            "LATITUD": "6.75",
            "EPICENTRO": "Los Santos - Santander, Colombia"
        },
        {
            "FECHA_LONG": 1722815940000,
            "NOMBRE_MUNICIPIO": "BOGOTÁ, D.C.",
            "FECHA": "04/08/2024 - 06:59 PM",
            "I": "2",
            "PROFUNDIDAD": "145",
            "NOMBRE_CENTRO_POBLADO": "BOGOTÁ, DISTRITO CAPITAL",
            "MAGNITUD": 3.6,
            "ID_CENTRO_POBLADO": 11001000,
            "FECHA_2": "2024/08/04 - 06:59 PM",
            "ID_SISMO": "SGC2024piiojw",
            "INT_MAX": "2",
            "LONGITUD": "-73.18",
            "NOMBRE": "BOGOTÁ  D. C.",
            "LATITUD": "6.77",
            "EPICENTRO": "Los Santos - Santander, Colombia"
        },
        {
            "FECHA_LONG": 1722681060000,
            "NOMBRE_MUNICIPIO": "BOGOTÁ, D.C.",
            "FECHA": "03/08/2024 - 05:31 AM",
            "I": "2",
            "PROFUNDIDAD": "153",
            "NOMBRE_CENTRO_POBLADO": "BOGOTÁ, DISTRITO CAPITAL",
            "MAGNITUD": 4.2,
            "ID_CENTRO_POBLADO": 11001000,
            "FECHA_2": "2024/08/03 - 05:31 AM",
            "ID_SISMO": "SGC2024pfmbnx",
            "INT_MAX": "3",
            "LONGITUD": "-73.14",
            "NOMBRE": "BOGOTÁ  D. C.",
            "LATITUD": "6.83",
            "EPICENTRO": "Los Santos - Santander, Colombia"
        },
        {
            "FECHA_LONG": 1722656940000,
            "NOMBRE_MUNICIPIO": "BOGOTÁ, D.C.",
            "FECHA": "02/08/2024 - 10:49 PM",
            "I": "2",
            "PROFUNDIDAD": "54",
            "NOMBRE_CENTRO_POBLADO": "BOGOTÁ, DISTRITO CAPITAL",
            "MAGNITUD": 3.3,
            "ID_CENTRO_POBLADO": 11001000,
            "FECHA_2": "2024/08/02 - 10:49 PM",
            "ID_SISMO": "SGC2024peysxl",
            "INT_MAX": "3",
            "LONGITUD": "-75.96",
            "NOMBRE": "BOGOTÁ  D. C.",
            "LATITUD": "4.81",
            "EPICENTRO": "Ansermanuevo - Valle del Cauca, Colombia"
        },
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
        },
        {
            "FECHA_LONG": 1722360720000,
            "NOMBRE_MUNICIPIO": "BOGOTÁ, D.C.",
            "FECHA": "30/07/2024 - 12:32 AM",
            "I": "2",
            "PROFUNDIDAD": "22",
            "NOMBRE_CENTRO_POBLADO": "BOGOTÁ, DISTRITO CAPITAL",
            "MAGNITUD": 4.3,
            "ID_CENTRO_POBLADO": 11001000,
            "FECHA_2": "2024/07/30 - 12:32 AM",
            "ID_SISMO": "SGC2024oxtgbm",
            "INT_MAX": "5",
            "LONGITUD": "-74.36",
            "NOMBRE": "BOGOTÁ  D. C.",
            "LATITUD": "3.59",
            "EPICENTRO": "Uribe - Meta, Colombia"
        },
        {
            "FECHA_LONG": 1722241440000,
            "NOMBRE_MUNICIPIO": "BOGOTÁ, D.C.",
            "FECHA": "29/07/2024 - 03:24 AM",
            "I": "3",
            "PROFUNDIDAD": "143",
            "NOMBRE_CENTRO_POBLADO": "BOGOTÁ, DISTRITO CAPITAL",
            "MAGNITUD": 2.0,
            "ID_CENTRO_POBLADO": 11001000,
            "FECHA_2": "2024/07/29 - 03:24 AM",
            "ID_SISMO": "SGC2024owdfnl",
            "INT_MAX": "4",
            "LONGITUD": "-73.15",
            "NOMBRE": "BOGOTÁ  D. C.",
            "LATITUD": "6.80",
            "EPICENTRO": "Los Santos - Santander, Colombia"
        }
    ]

    """.data(using: .utf8)!
