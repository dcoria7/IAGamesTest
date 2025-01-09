//
//  GameDetailEditView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import SwiftUI

struct GameDetailEditView: View {
	
	var game: Game
	@EnvironmentObject private var coordinator: Coordinator
	@StateObject var viewModel: GameDetailEditViewModel
	
	init(game: Game, dependency: DependencyContainer) {
		self.game = game
		self._viewModel = StateObject(wrappedValue:
										GameDetailEditViewModel(dependency: dependency, game: game))
	}
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				makeHeader()
				makeBody()
				makeDescription()
				makeActionButton()
				
				Spacer()
				
			}
			.padding(.horizontal, 20)
		}
	}
	
	@ViewBuilder
	private func makeHeader() -> some View {
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
	
	@ViewBuilder
	private func makeBody() -> some View {
		EditGameFieldView(title: "Platform",
						  placeholder: "Game Platform",
						  axis: .vertical,
						  text: $viewModel.platform)
		
		EditGameFieldView(title: "Category",
						  placeholder: "Game Category",
						  axis: .horizontal,
						  text: $viewModel.genre)
	}
	
	@ViewBuilder
	private func makeDescription() -> some View {
		EditGameFieldView(title: "Description",
						  placeholder: "Game Description",
						  axis: .vertical,
						  text: $viewModel.description)
	}
	
	@ViewBuilder
	private func makeActionButton() -> some View {
		HStack {
			Button(action: {
				viewModel.updateObject(game: game)
				coordinator.pop()
			}) {
				Text("Save")
					.font(Font.subheadline)
					.foregroundStyle(.white)
					.padding(.horizontal)
			}
			.frame(height: 30)
			.background(.green)
			.cornerRadius(10)
			
		}
	}
}
