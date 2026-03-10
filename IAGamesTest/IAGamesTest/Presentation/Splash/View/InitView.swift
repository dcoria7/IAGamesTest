//
//  InitView.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import SwiftUI

struct InitView: View {
	
	@Environment(AppRootManager.self) private var appRootManager
	
	@State private var viewModel: InitViewModel
	
	init(viewModel: InitViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		VStack {
			IconView(.appIcon, .original)
				.frame(height: 100)
				.clipShape(.rect(cornerRadius: 10))
				.padding()
			
			Text("Loading...")
			ProgressView()
				.frame(width: 100)
		}
		.frame(maxWidth: .infinity,  maxHeight: .infinity)
		.modifier(SplashGlassBackground())
		.onAppear {
			Task {
				do {
					try await viewModel.fetchData()
				} catch NetworkError.noInternet(let error) {
					// show error message
					print(error)
				}
				
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					withAnimation(.spring()) {
						appRootManager.currentRoot = .homeCoordinator
					}
				}
			}
		}
	}
}

// MARK: - iOS 26 Glass Effect Fallback
struct SplashGlassBackground: ViewModifier {
	func body(content: Content) -> some View {
		if #available(iOS 26, *) {
			content
				.glassEffect(.regular.interactive(), in: .rect)
		} else {
			content
				.background(.ultraThinMaterial)
		}
	}
}
