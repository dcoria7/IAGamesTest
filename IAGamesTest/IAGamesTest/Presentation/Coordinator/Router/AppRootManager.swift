//
//  AppRootManager.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation

final class AppRootManager: ObservableObject {
	
	@Published var currentRoot: AppRoots = .splash
	
	enum AppRoots {
		case splash
		case homeCoordinator
	}
}
