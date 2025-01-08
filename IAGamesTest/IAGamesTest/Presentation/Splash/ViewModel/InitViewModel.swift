//
//  InitViewModel.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation

@MainActor
class InitViewModel: ObservableObject {
	
	var dependency: DependencyContainer
	
	init(dependency: DependencyContainer) {
		self.dependency = dependency
	}
	
	func fetchData() async throws {
		try? await dependency.gamesRepository().fetchGames()
	}
}
