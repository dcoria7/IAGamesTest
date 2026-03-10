//
//  AppRootManager.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation
import Observation

@Observable
final class AppRootManager {
	
	var currentRoot: AppRoots = .splash
	
	enum AppRoots {
		case splash
		case homeCoordinator
	}
}
