//
//  GamesRepository.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation
import SwiftUI

protocol GamesRepository {
	func fetchGames() async throws
}

final class GamesRepositoryImpl: GamesRepository {
	
	private let networkClient: ClientNetworkAPI
	private var dataManager = DataController.shared
	
	init(networkClient: ClientNetworkAPI) {
		self.networkClient = networkClient
	}
	
	func fetchGames() async throws {
		let responseData = try await networkClient.getRequest(endpoint: AppConfig.Endpoints.games.rawValue)
		
//		// store locally
		for game in responseData {
			dataManager.add(gameModel: game)
		}
		dataManager.save()
	}
}
