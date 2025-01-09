//
//  InitView.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import SwiftUI

struct InitView: View {
	
	@EnvironmentObject private var appRootManager: AppRootManager
	
	@StateObject var viewModel: InitViewModel
	
	var body: some View {
		VStack {
			IconView(.appIcon, .original)
				.frame(height: 100)
				.cornerRadius(10, corners: .allCorners)
				.padding()
			
			Text("Loading...")
			ProgressView()
				.frame(width: 100)
		}
		.frame(maxWidth: .infinity,  maxHeight: .infinity)
		.background(.black.opacity(0.5))
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
