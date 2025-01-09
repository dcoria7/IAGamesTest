//
//  DataController.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation
import CoreData
import SwiftUI

class DataController: ObservableObject {
	
	// A singleton for our entire app to use
	static let shared = DataController()
	
	// Storage for Core Data
	let container: NSPersistentContainer
	
	// An initializer to load Core Data, optionally able
	// to use an in-memory store.
	init(inMemory: Bool = false) {
		container = NSPersistentContainer(name: "GameData")
		
		container.loadPersistentStores { description, error in
			if let error = error {
				fatalError("Error: \(error.localizedDescription)")
			}
		}
	}
	
	func storeData(responseData: [GameModel]) {
		for gameModel in responseData {
			
			let game = Game(context: self.container.viewContext)
			game.id = Int32(gameModel.id ?? 0)
			game.title = gameModel.title
			game.thumbnail = gameModel.thumbnail
			game.shortdescription = gameModel.shortDescription
			game.gameUrl = gameModel.gameUrl
			game.genre = gameModel.genre
			game.platform = gameModel.platform
			game.publisher = gameModel.publisher
			game.developer = gameModel.developer
			game.releaseDate = gameModel.releaseDate
			game.freetogameProfileUrl = gameModel.freetogameProfileUrl
		}
		
		save()
		
	}
	
	func removeGame(game: Game) {
		container.viewContext.delete(game)
		
		save()
	}
	
	func updateGame(game: Game, newGame: GameModel) {
		game.title = newGame.title
		game.shortdescription = newGame.shortDescription
		game.genre = newGame.genre
		game.platform = newGame.platform
		game.publisher = newGame.publisher
		
		save()
	}
	
	func save() {
		let context = container.viewContext
		
		if context.hasChanges {
			context.performAndWait {
				do {
					try context.save()
					try context.parent?.save()
				} catch {
					// Show some error here
					print(error.localizedDescription)
				}
			}
		}
	}
}
