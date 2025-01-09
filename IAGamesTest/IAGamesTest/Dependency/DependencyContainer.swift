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
		
		parentContainer.register(ClientNetworkAPI.self) { _ in
			NetworkManager()
		}.inObjectScope(.container)
		
		parentContainer.register(GamesRepository.self) { _ in
			GamesRepositoryImpl(networkClient: self.networkManager())
		}.inObjectScope(.container)
		
		parentContainer.register(GamesUseCase.self) { _ in
			GamesUseCaseImp(gamesRepository: self.gamesRepository())
		}.inObjectScope(.container)
		
	}
	
	func gamesRepository() -> GamesRepository {
		parentContainer.resolve(GamesRepository.self)!
	}
	
	func networkManager() -> ClientNetworkAPI {
		parentContainer.resolve(ClientNetworkAPI.self)!
	}
	
	func gamesUseCase() -> GamesUseCase {
		parentContainer.resolve(GamesUseCase.self)!
	}
}
