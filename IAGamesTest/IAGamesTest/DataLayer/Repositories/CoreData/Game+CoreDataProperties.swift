//
//  Game+CoreDataProperties.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var id: Int16
    @NSManaged public var title: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var shortdescription: String?
    @NSManaged public var gameUrl: String?
    @NSManaged public var genre: String?
    @NSManaged public var platform: String?
    @NSManaged public var publisher: String?
    @NSManaged public var developer: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var freetogameProfileUrl: String?
	
	public var wrappedTitle: String {
		title ?? "Unknown Title"
	}
	
	public var wrappedThumbnail: String {
		thumbnail ?? "Unknown thumbnail"
	}
	
	public var wrappedDescription: String {
		shortdescription ?? "Unknown shortdescription"
	}
	
	public var wrappedGameUrl: String {
		gameUrl ?? "Unknown gameUrl"
	}
	
	public var wrappedGenre: String {
		genre ?? "Unknown genre"
	}
	
	public var wrappedPlatform: String {
		platform ?? "Unknown platform"
	}
	
	public var wrappedPublisher: String {
		publisher ?? "Unknown publisher"
	}
	
	public var wrappedDeveloper: String {
		developer ?? "Unknown developer"
	}
	
	public var wrappedReleaseDate: String {
		releaseDate ?? "Unknown releaseDate"
	}
	
	public var wrappedFreetogameProfileUrl: String {
		freetogameProfileUrl ?? "Unknown freetogameProfileUrl"
	}

}

extension Game : Identifiable {

}
