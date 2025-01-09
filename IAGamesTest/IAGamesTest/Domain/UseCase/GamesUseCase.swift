//
//  GamesUseCase.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

protocol GamesUseCase {
	func executeFetchGames() async throws
	func executeRemoveGame(game: Game)
	func executeUpdateGame(game: Game, newGame: GameModel)
}

final class GamesUseCaseImp: GamesUseCase {
	private let gamesRepository: GamesRepository
	
	init(gamesRepository: GamesRepository) {
		self.gamesRepository = gamesRepository
	}
	
	func executeFetchGames() async throws {
		try await gamesRepository.fetchGames()
	}
	
	func executeRemoveGame(game: Game) {
		gamesRepository.removeGame(game: game)
	}
	
	func executeUpdateGame(game: Game, newGame: GameModel) {
		gamesRepository.updateGame(game: game, newGame: newGame)
	}
}
