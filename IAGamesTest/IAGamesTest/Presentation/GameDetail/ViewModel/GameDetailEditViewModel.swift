//
//  GameDetailEditViewModel.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import Foundation
import SwiftUI

class GameDetailEditViewModel: ObservableObject {
	
	@Published var title = ""
	@Published var publisher = ""
	@Published var platform = ""
	@Published var genre = ""
	@Published var description = ""
	
	private var useCase: GamesUseCase
	
	init(dependency: DependencyContainer) {
		self.useCase = dependency.gamesUseCase()
	}
	
	init(dependency: DependencyContainer, game: Game) {
		self.useCase = dependency.gamesUseCase()
		
		self.title = game.wrappedTitle
		self.publisher = game.wrappedPublisher
		self.platform = game.wrappedPlatform
		self.genre = game.wrappedGenre
		self.description = game.wrappedDescription
	}
	
	func updateObject(game: Game) {
		let newGame = GameModel(title: title,
								shortDescription: description,
								genre: genre,
								platform: platform,
								publisher: publisher)
		
		useCase.executeUpdateGame(game: game, newGame: newGame)
	}
	
}
