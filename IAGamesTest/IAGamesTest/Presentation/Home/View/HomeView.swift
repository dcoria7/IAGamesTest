//
//  HomeView.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import SwiftUI

struct HomeView: View {
	@FetchRequest(entity: Game.entity(), sortDescriptors: []) var allGames: FetchedResults<Game>
	
	@StateObject var viewModel = HomeViewModel()
	
	var body: some View {
		NavigationStack {
			ListOfGameView(allGames: allGames)
		}
	}
}

#Preview {
	HomeView()
}
