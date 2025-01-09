//
//  GameModel.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//


struct GameModel: Codable {
	let id: Int?
	let title: String
	let thumbnail: String?
	let shortDescription: String
	let gameUrl: String?
	let genre: String
	let platform: String
	let publisher: String
	let developer: String?
	let releaseDate: String?
	let freetogameProfileUrl: String?
	
	enum CodingKeys: String, CodingKey {
		case id
		case title
		case thumbnail
		case shortDescription = "short_description"
		case gameUrl = "game_url"
		case genre
		case platform
		case publisher
		case developer
		case releaseDate = "release_date"
		case freetogameProfileUrl = "freetogame_profile_url"
	}
	
	init(
		title: String,
		shortDescription: String,
		genre: String,
		platform: String,
		publisher: String
	) {
		self.id = nil
		self.title = title
		self.thumbnail = nil
		self.shortDescription = shortDescription
		self.gameUrl = nil
		self.genre = genre
		self.platform = platform
		self.publisher = publisher
		self.developer = nil
		self.releaseDate = nil
		self.freetogameProfileUrl = nil
	}
	
}
