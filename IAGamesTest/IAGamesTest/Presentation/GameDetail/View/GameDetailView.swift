//
//  GameDetailView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import SwiftUI
import Kingfisher

struct GameDetailView: View {
	var game: Game
	
    var body: some View {
		VStack {
			KFImage(URL(string: game.wrappedThumbnail))
				.placeholder {
					ProgressView()
						.frame(width: 100)
				}
				.resizable()
				.aspectRatio(contentMode: .fill)
				.clipped()
			
			
		}
    }
}
