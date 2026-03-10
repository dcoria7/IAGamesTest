//
//  GameDetailEditView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import SwiftUI

struct GameDetailEditView: View {
	
	let game: Game
	@State private var viewModel: GameDetailEditViewModel
	
	init(game: Game, dependency: DependencyContainer) {
		self.game = game
		self.viewModel = GameDetailEditViewModel(dependency: dependency, game: game)
	}
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				GameDetailEditHeaderView(viewModel: viewModel)
				GameDetailEditBodyView(viewModel: viewModel)
				GameDetailEditDescriptionView(viewModel: viewModel)
				GameDetailEditActionButtonView(game: game, viewModel: viewModel)
				
				Spacer()
			}
			.padding(.horizontal, 20)
		}
	}
}

struct GameDetailEditHeaderView: View {
	@Bindable var viewModel: GameDetailEditViewModel
	
	var body: some View {
		EditGameFieldView(title: "Title",
						  placeholder: "Game Title",
						  axis: .vertical,
						  text: $viewModel.title)
		.autocapitalization(.none)
		
		EditGameFieldView(title: "Publisher",
						  placeholder: "Game Publisher",
						  axis: .vertical,
						  text: $viewModel.publisher)
	}
}

struct GameDetailEditBodyView: View {
	@Bindable var viewModel: GameDetailEditViewModel
	
	var body: some View {
		EditGameFieldView(title: "Platform",
						  placeholder: "Game Platform",
						  axis: .vertical,
						  text: $viewModel.platform)
		
		EditGameFieldView(title: "Category",
						  placeholder: "Game Category",
						  axis: .horizontal,
						  text: $viewModel.genre)
	}
}

struct GameDetailEditDescriptionView: View {
	@Bindable var viewModel: GameDetailEditViewModel
	
	var body: some View {
		EditGameFieldView(title: "Description",
						  placeholder: "Game Description",
						  axis: .vertical,
						  text: $viewModel.description)
	}
}

struct GameDetailEditActionButtonView: View {
	let game: Game
	let viewModel: GameDetailEditViewModel
	@Environment(Coordinator.self) private var coordinator
	
	var body: some View {
		HStack {
			Button(action: {
				viewModel.updateObject(game: game)
				coordinator.pop()
			}) {
				Text("Save")
					.font(.subheadline)
					.foregroundStyle(.white)
					.padding(.horizontal)
			}
			.frame(height: 30)
			.applyGlassEffect(fallback: .ultraThinMaterial)
			// Added applyGlassEffect to respect Liquid Glass styles (iOS 26+)
		}
	}
}
