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
	
	nonisolated func handleError(error: CustomError) -> Error {
		
		return error
	}
	
	public func requestGET(url: URL) async throws -> Data {
		
		let (data, response) = try await URLSession.shared.data(from: url)
		return data
	}
		
		
		
}
