//
//  GameDetailViewModel.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import Foundation
import SwiftUI

class GameDetailViewModel: ObservableObject {
	
	private var useCase: GamesUseCase
	
	init(dependency: DependencyContainer) {
		self.useCase = dependency.gamesUseCase()
	}
	
	func removeObject(game: Game) {
		useCase.executeRemoveGame(game: game)
	}
}

extension GameDetailViewModel: Hashable, Equatable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(ObjectIdentifier(self))
	}
	
	static func == (lhs: GameDetailViewModel, rhs: GameDetailViewModel) -> Bool {
		ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
	}
	
	
}
