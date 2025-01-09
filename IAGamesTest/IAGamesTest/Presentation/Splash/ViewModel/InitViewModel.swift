//
//  InitViewModel.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation

class InitViewModel: ObservableObject {
	
	private var useCase: GamesUseCase
	
	init(dependency: DependencyContainer) {
		self.useCase = dependency.gamesUseCase()
	}
	
	func fetchData() async throws {
		// validate if there's internet connections
		let isConnectionAvailable: Bool = true
		
		if isConnectionAvailable {
			try? await useCase.executeFetchGames()
		} else {
			throw NetworkError.noInternet("no internet connection")
		}
	}
}
