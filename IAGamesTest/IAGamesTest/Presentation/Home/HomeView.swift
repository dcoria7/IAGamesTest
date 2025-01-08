//
//  HomeView.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import SwiftUI

struct HomeView: View {
	@FetchRequest(entity: Game.entity(),
				  sortDescriptors: []) var allGames: FetchedResults<Game>
	
	private let fixedColumns = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	
	var body: some View {
		NavigationStack {
			ScrollView(.vertical) {
				LazyVGrid(columns: fixedColumns, spacing: 20) {
					ForEach(allGames) { game in
						GameView(game: game)
							.frame(alignment: .center)
					}
				}
			}
			.padding(.horizontal, 10)
		}
	}
}

#Preview {
	HomeView()
}
