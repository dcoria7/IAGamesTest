//
//  Coordinator.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import Foundation
import SwiftUI

enum AppPages: Hashable, Equatable {
	case home
	case detail(game: Game, viewModel: GameDetailViewModel)
	case edit(game: Game)
}

class Coordinator: ObservableObject {
	var dependency: DependencyContainer
	@Published var path: NavigationPath = NavigationPath()
	
	init(dependency: DependencyContainer) {
		self.dependency = dependency
	}
	
	func push(page: AppPages) {
		path.append(page)
	}
	
	func pop() {
		path.removeLast()
	}
	
	@ViewBuilder
	func build(page: AppPages) -> some View {
		switch page {
			case .home: HomeView()
			case .detail(let game, let viewModel): GameDetailView(game: game, viewModel: viewModel)
			case .edit(let game): GameDetailEditView(game: game, dependency: dependency)
		}
	}
	
}
