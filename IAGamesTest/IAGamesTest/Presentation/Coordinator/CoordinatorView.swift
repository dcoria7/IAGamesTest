//
//  CoordinatorView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import Foundation
import SwiftUI

struct CoordinatorView: View {
	
	@State private var coordinator: Coordinator
	
	init(dependency: DependencyContainer) {
		self._coordinator = State(initialValue: Coordinator(dependency: dependency))
	}
	
	var body: some View {
		@Bindable var bindableCoordinator = coordinator
		NavigationStack(path: $bindableCoordinator.path) {
			coordinator.build(page: .home)
				.navigationDestination(for: AppPages.self) { page in
					coordinator.build(page: page)
				}
		}
		.environment(coordinator)
	}
}
