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
			Text("Loading....")
		}
		.frame(maxWidth: .infinity,  maxHeight: .infinity)
		.background(.red)
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
