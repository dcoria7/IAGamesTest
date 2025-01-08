//
//  ClientNetwork.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation

enum CustomError: Error {
	case invalidURL
}

protocol ClientNetworkAPI {
	func handleError(error: CustomError) -> Error
	func getRequest(endpoint: String) async throws -> [GameModel]
}

extension NetworkManager: ClientNetworkAPI {
	func getRequest(endpoint: String) async throws -> [GameModel] {
		let baseURL = AppConfig.baseURL + endpoint
		guard let url = URL(string: baseURL) else {
			throw handleError(error: .invalidURL)
		}
		let ws = NetworkAPI(requestURL: url, networkManager: self)
		
		do {
			return try await ws.getRequest()
		} catch {
			throw error
		}
	}
}

