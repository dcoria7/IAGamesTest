//
//  GamesRepository.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation

protocol GamesRepository {
	func fetchGames() async throws
}

final class GamesRepositoryImpl: GamesRepository {
	
	private let networkClient: ClientNetworkAPI
	
	init(networkClient: ClientNetworkAPI = NetworkManager()) {
		self.networkClient = networkClient
	}
	
	func fetchGames() async throws {
		let responseData = try await networkClient.getRequest(endpoint: AppConfig.Endpoints.games.rawValue)
		
		// save locally
		print(responseData)
	}
}
