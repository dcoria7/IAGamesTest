//
//  CoordinatorView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import Foundation
import SwiftUI

struct CoordinatorView: View {
	
	@StateObject private var coordinator: Coordinator
	
	init(dependency: DependencyContainer) {
		_coordinator = StateObject(
			wrappedValue: Coordinator(dependency: dependency))
	}
	
	var body: some View {
		NavigationStack(path: $coordinator.path) {
			coordinator.build(page: .home)
				.navigationDestination(for: AppPages.self) { page in
					coordinator.build(page: page)
				}
		}
		.environmentObject(coordinator)
	}
}
