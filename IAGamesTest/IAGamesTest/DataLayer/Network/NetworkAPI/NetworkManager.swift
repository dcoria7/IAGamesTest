//
//  NetworkManager.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation

actor NetworkManager {
	
	//shared instance
	static let shared = NetworkManager()
	
	nonisolated func handleError(error: NetworkError) -> Error {
		return error
	}
	
	public func requestGET(url: URL) async throws -> Data {
		
		// This can be replaced for another network library
		let (data, _) = try await URLSession.shared.data(from: url)
		return data
	}
		
		
		
}
