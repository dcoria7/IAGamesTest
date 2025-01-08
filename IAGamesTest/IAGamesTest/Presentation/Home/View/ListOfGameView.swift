//
//  ListOfGameView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import SwiftUI

struct ListOfGameView: View {
	
	@State private var searchText = ""
	@State private var selectedGenre: String = ""
	
	private let fixedColumns = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	var allGames: FetchedResults<Game>
	
	var body: some View {
		DynamicFetchRequestView(withSearchText: searchText, category: selectedGenre) { results in
			
			ScrollView(.vertical) {
				
				makeDropDown(results: results)
				makeClearButton()
				makeGameList(results: results)
				
			}
			.searchable(text: $searchText, placement: .automatic, prompt: "Search")
			.scrollDismissesKeyboard(.immediately)
			
		}
		.padding(.horizontal, 10)
		.navigationTitle("Freetogame")
		.navigationDestination(for: Game.self) { game in
			GameDetailView(game: game)
		}
	}
	
	@ViewBuilder
	private func makeDropDown(results: FetchedResults<Game>) -> some View {
		DropDownPicker(
			selection: $selectedGenre,
			options:
				results.count > 1 ?
			results.map { $0.wrappedGenre }.unique() :
				allGames.compactMap(\.wrappedGenre).unique()
			
		)
	}
	
	@ViewBuilder
	private func makeClearButton() -> some View {
		Button(action: {
			selectedGenre = ""
		}) {
			Text("Clear")
				.foregroundStyle(.white)
		}
		.frame(width: 50, height: 30)
		.background(.black)
		.cornerRadius(10)
	}
	
	@ViewBuilder
	private func makeGameList(results: FetchedResults<Game>) -> some View {
		LazyVGrid(columns: fixedColumns, spacing: 20) {
			ForEach(results.count > 1 ? results : allGames) { game in
				NavigationLink(value: game) {
					GameView(game: game)
				}
			}
		}
	}
}

