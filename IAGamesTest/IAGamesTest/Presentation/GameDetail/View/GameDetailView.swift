//
//  GameDetailView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import SwiftUI
import Kingfisher

struct GameDetailView: View {
	
	@State var game: Game
	@EnvironmentObject private var coordinator: Coordinator
	@Environment(\.openURL) var openURL
	@EnvironmentObject private var dependency: DependencyContainer
	
	@StateObject var viewModel: GameDetailViewModel
	@State private var updateButtonTapped: Bool = false
	
	var body: some View {
		NavigationView {
			ScrollView {
				KFImage(URL(string: game.wrappedThumbnail)!)
					.placeholder {
						ProgressView()
							.frame(width: 100)
					}
					.resizable()
					.frame(maxHeight: 500)
					.scaledToFit()
					.clipped()
					.clipShape(Rectangle())
					.cornerRadius(15, corners: [.topLeft, .topRight])
				
				VStack(alignment: .leading) {
					makeHeader()
					makeSeparator()
					makeBody()
					makeButtons()
					makeSeparator()
						.padding(.bottom, 10)
					
					makeDescription()
					
					makeActionButtons()
					
					Spacer()
					
				}
				.padding(.horizontal, 20)
			}
		}
	}
	
	@ViewBuilder
	private func makeHeader() -> some View {
		Text(game.wrappedTitle)
			.font(Font.headline)
		
		Text(game.wrappedPublisher)
			.font(Font.footnote)
			.padding(.bottom, 10)
	}
	
	@ViewBuilder
	private func makeBody() -> some View {
		HStack {
			IconView(.categoryIcon, .original)
				.frame(width: 30, height: 20)
			
			Text(game.wrappedPlatform)
				.font(Font.title)
		}
		
		Text("Category:")
			.font(Font.subheadline.bold())
		
		Text(game.wrappedGenre)
			.font(Font.subheadline)
		
	}
	
	@ViewBuilder
	private func makeButtons() -> some View {
		HStack {
			Button(action: {
				openURL(URL(string: game.wrappedGameUrl)!)
			}) {
				Text("Go to Game page")
					.font(Font.subheadline)
					.foregroundStyle(.white)
					.padding(.horizontal)
			}
			.frame(height: 30)
			.background(.black.opacity(0.3))
			.cornerRadius(10)
			
			
			Button(action: {
				openURL(URL(string: game.wrappedFreetogameProfileUrl)!)
			}) {
				Text("Go to freegame")
					.font(Font.subheadline)
					.foregroundStyle(.white)
					.padding(.horizontal)
			}
			.frame( height: 30)
			.background(.blue.opacity(0.5))
			.cornerRadius(10)
		}
	}
	
	@ViewBuilder
	private func makeDescription() -> some View {
		Text("Description: ")
			.font(Font.subheadline.bold())
		
		Text(game.wrappedDescription)
			.font(Font.subheadline)
	}
	
	@ViewBuilder
	private func makeActionButtons() -> some View {
		HStack {
			Button(action: {
				viewModel.removeObject(game: game)
				coordinator.pop()
			}) {
				Text("Remove from Database")
					.font(Font.subheadline)
					.foregroundStyle(.white)
					.padding(.horizontal)
			}
			.frame(height: 30)
			.background(.red.opacity(0.5))
			.cornerRadius(10)
			
			
			Button(action: {
				coordinator.push(page: .edit(game: game))
			}) {
				Text("Update information")
					.font(Font.subheadline)
					.foregroundStyle(.white)
					.padding(.horizontal)
			}
			.frame( height: 30)
			.background(.gray.opacity(0.5))
			.cornerRadius(10)
		}
	}
	
	
	
	@ViewBuilder
	private func makeSeparator() -> some View {
		Rectangle()
			.foregroundColor(.clear)
			.frame(height: 1)
			.background(.black)
			.opacity(0.2)
	}
}
