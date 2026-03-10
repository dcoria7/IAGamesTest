//
//  GameDetailView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import SwiftUI
import Kingfisher

struct GameDetailView: View {
	
	let game: Game
	@Environment(Coordinator.self) private var coordinator
	@Environment(\.openURL) var openURL
	@Environment(DependencyContainer.self) private var dependency
	
	let viewModel: GameDetailViewModel
	
	var body: some View {
		ScrollView {
			GameDetailHeaderImageView(imageUrl: game.wrappedThumbnail)
			
			VStack(alignment: .leading) {
				GameDetailHeaderView(title: game.wrappedTitle, publisher: game.wrappedPublisher)
				makeSeparator()
				GameDetailBodyView(platform: game.wrappedPlatform, genre: game.wrappedGenre)
				GameDetailLinkButtonsView(gameUrl: game.wrappedGameUrl, profileUrl: game.wrappedFreetogameProfileUrl)
				makeSeparator()
					.padding(.bottom, 10)
				
				GameDetailDescriptionView(description: game.wrappedDescription)
				
				GameDetailActionButtonsView(
					onRemove: {
						viewModel.removeObject(game: game)
						coordinator.pop()
					},
					onUpdate: {
						coordinator.push(page: .edit(game: game))
					}
				)
				
				Spacer()
			}
			.padding(.horizontal, 20)
		}
	}
	
	@ViewBuilder
	private func makeSeparator() -> some View {
		Rectangle()
			.foregroundStyle(.clear)
			.frame(height: 1)
			.background(.black)
			.opacity(0.2)
	}
}

struct GameDetailHeaderImageView: View {
	let imageUrl: String
	
	var body: some View {
		if let url = URL(string: imageUrl) {
			KFImage(url)
				.placeholder {
					ProgressView()
						.frame(width: 100)
				}
				.resizable()
				.frame(maxHeight: 500)
				.scaledToFit()
				.clipped()
				.clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
		}
	}
}

struct GameDetailHeaderView: View {
	let title: String
	let publisher: String
	
	var body: some View {
		Text(title)
			.font(.headline)
		
		Text(publisher)
			.font(.footnote)
			.padding(.bottom, 10)
	}
}

struct GameDetailBodyView: View {
	let platform: String
	let genre: String
	
	var body: some View {
		HStack {
			IconView(.categoryIcon, .original)
				.frame(width: 30, height: 20)
			
			Text(platform)
				.font(.title)
		}
		
		Text("Category:")
			.font(.subheadline.bold())
		
		Text(genre)
			.font(.subheadline)
	}
}

struct GameDetailLinkButtonsView: View {
	let gameUrl: String
	let profileUrl: String
	@Environment(\.openURL) var openURL
	
	var body: some View {
		if #available(iOS 26, *) {
			GlassEffectContainer(spacing: 10) {
				buttonsContent
			}
		} else {
			HStack(spacing: 10) {
				buttonsContent
			}
		}
	}
	
	@ViewBuilder
	private var buttonsContent: some View {
		if let url = URL(string: gameUrl) {
			Button(action: {
				openURL(url)
			}) {
				Text("Go to Game page")
					.font(.subheadline)
					.foregroundStyle(.primary)
					.padding(.horizontal)
			}
			.frame(height: 30)
			.applyGlassEffect(fallback: .ultraThinMaterial)
		}
		
		if let url = URL(string: profileUrl) {
			Button(action: {
				openURL(url)
			}) {
				Text("Go to freegame")
					.font(.subheadline)
					.foregroundStyle(.primary)
					.padding(.horizontal)
			}
			.frame(height: 30)
			.applyGlassEffect(fallback: .ultraThickMaterial)
		}
	}
}

struct GameDetailDescriptionView: View {
	let description: String
	
	var body: some View {
		Text("Description: ")
			.font(.subheadline.bold())
		
		Text(description)
			.font(.subheadline)
	}
}

struct GameDetailActionButtonsView: View {
	let onRemove: () -> Void
	let onUpdate: () -> Void
	
	var body: some View {
		if #available(iOS 26, *) {
			GlassEffectContainer(spacing: 10) {
				buttonsContent
			}
		} else {
			HStack(spacing: 10) {
				buttonsContent
			}
		}
	}
	
	@ViewBuilder
	private var buttonsContent: some View {
		Button(action: onRemove) {
			Text("Remove from Database")
				.font(.subheadline)
				.foregroundStyle(.red)
				.padding(.horizontal)
		}
		.frame(height: 30)
		.applyGlassEffect(fallback: .ultraThinMaterial)
		
		Button(action: onUpdate) {
			Text("Update information")
				.font(.subheadline)
				.foregroundStyle(.primary)
				.padding(.horizontal)
		}
		.frame(height: 30)
		.applyGlassEffect(fallback: .ultraThinMaterial)
	}
}

