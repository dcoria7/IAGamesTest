//
//  GameView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import SwiftUI
import Kingfisher

struct GameView: View {
	var game: Game
	
	var body: some View {
		VStack(alignment: .center) {
			KFImage(URL(string: game.wrappedThumbnail))
				.placeholder {
					ProgressView()
						.frame(width: 100)
				}
				.resizable()
				.aspectRatio(contentMode: .fill)
				.clipped()
		}
		.cornerRadius(10)
	}
}
