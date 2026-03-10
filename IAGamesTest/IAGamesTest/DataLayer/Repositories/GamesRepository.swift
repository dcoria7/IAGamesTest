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
	func removeGame(game: Game)
	func updateGame(game: Game, newGame: GameModel)
	func testResponse() async throws -> [GameModel]
}

final class GamesRepositoryImpl: GamesRepository {
	
	private let networkClient: ClientNetworkAPI
	private var dataManager = DataController.shared
	
	init(networkClient: ClientNetworkAPI) {
		self.networkClient = networkClient
	}
	
	func fetchGames() async throws {
		let responseData = try await networkClient.getRequest(endpoint: AppConfig.Endpoints.games.rawValue)
		
		// store locally
		dataManager.storeData(responseData: responseData)
	}
	
	func testResponse() async throws -> [GameModel] {
		try await networkClient.getRequest(endpoint: AppConfig.Endpoints.games.rawValue)
	}
	
	func removeGame(game: Game) {
		dataManager.removeGame(game: game)
	}
	
	func updateGame(game: Game, newGame: GameModel) {
		dataManager.updateGame(game: game, newGame: newGame)
	}
}
