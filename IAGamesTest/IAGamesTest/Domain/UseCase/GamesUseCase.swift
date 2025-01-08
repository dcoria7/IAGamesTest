//
//  GamesUseCase.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

protocol GamesUseCase {
	func executeFetchGames() async throws
}

final class GamesUseCaseImp: GamesUseCase {
	private let gamesRepository: GamesRepository
	
	init(gamesRepository: GamesRepository) {
		self.gamesRepository = gamesRepository
	}
	
	func executeFetchGames() async throws {
		try await gamesRepository.fetchGames()
	}
}
