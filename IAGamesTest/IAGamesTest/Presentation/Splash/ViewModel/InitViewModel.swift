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
	var repository: GamesRepository
	
	init(dependency: DependencyContainer) {
		self.dependency = dependency
		self.repository = dependency.gamesRepository()
	}
	
	func fetchData() async throws {
		// validate if there's connections
		let isConnectionAvailable: Bool = false
		
		if isConnectionAvailable {
			try? await repository.fetchGames()
		} else {
			throw NetworkError.noInternet("no internet connection")
		}
	}
}
