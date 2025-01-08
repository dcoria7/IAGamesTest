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
	
	init(viewModel: InitViewModel) {
		self._viewModel = StateObject(wrappedValue: viewModel)
	}
	
	var body: some View {
		VStack {
			Text("Loading....")
			Image(systemName: "tempo")
		}
		.frame(maxWidth: .infinity,  maxHeight: .infinity)
		.background(.red)
		.onAppear {
			Task {
				do {
					try await viewModel.fetchData()
					
					DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
						withAnimation(.spring()) {
							appRootManager.currentRoot = .home
						}
					}
				} catch {
					// handle error message
				}
			}
		}
	}
}
