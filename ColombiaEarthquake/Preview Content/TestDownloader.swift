//
//  TestDownloader.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 23/07/24.
//

import Foundation


class TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        return testColombiaQuakesData
    }
}
