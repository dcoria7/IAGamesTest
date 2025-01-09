//
//  ClientNetwork.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation

enum NetworkError: Error {
	case invalidURL
	case noInternet(String)
}

protocol ClientNetworkAPI {
	func handleError(error: NetworkError) -> Error
	func getRequest(endpoint: String) async throws -> [GameModel]
}

extension NetworkManager: ClientNetworkAPI {
	func getRequest(endpoint: String) async throws -> [GameModel] {
		let baseURL = AppConfig.baseURL + endpoint
		guard let url = URL(string: baseURL) else {
			throw handleError(error: .invalidURL)
		}
		let api = NetworkAPI(requestURL: url, networkManager: self)
		
		do {
			return try await api.getRequest()
		} catch {
			throw error
		}
	}
}

