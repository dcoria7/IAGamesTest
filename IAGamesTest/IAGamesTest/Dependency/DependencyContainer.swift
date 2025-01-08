//
//  DependencyContainer.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation
import Swinject

class DependencyContainer: ObservableObject {
	
	// Container
	let parentContainer: Container
	
	init() {
		parentContainer = Container()
		registerDependencies()
	}
	
	func registerDependencies() {
		
		parentContainer.register(GamesRepository.self) { _ in
			return GamesRepositoryImpl()
		}.inObjectScope(.container)
		
	}
	
	func gamesRepository() -> GamesRepository {
		return parentContainer.resolve(GamesRepository.self)!
	}
}
