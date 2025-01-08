//
//  AppRootManager.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation

final class AppRootManager: ObservableObject {
	
	@Published var currentRoot: eAppRoots = .splash
	
	enum eAppRoots {
		case splash
		case home
	}
}
