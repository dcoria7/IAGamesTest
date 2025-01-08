//
//  HomeViewModel.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
	
	@Published var searchText: String = ""
	
	var categoriesArray: [String] = []
	
	func createCategoriesArray() {
		categoriesArray = ["Action", "Adventure", "Strategy", "Casual", "RPG"]
	}
	
	
}
