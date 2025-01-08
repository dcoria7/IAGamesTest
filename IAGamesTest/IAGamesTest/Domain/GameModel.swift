//
//  GameModel.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//


struct GameModel: Codable {
	let id: Int
	let title: String
	let thumbnail: String
	let shortDescription: String
	let gameUrl: String
	let genre: String
	let platform: String
	let publisher: String
	let developer: String
	let releaseDate: String
	let freetogameProfileUrl: String
	
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
	
}

//"id":582,"title":"Tarisland","thumbnail":"https:\/\/www.freetogame.com\/g\/582\/thumbnail.jpg","short_description":"A cross-platform MMORPG developed by Level Infinite and Published by Tencent.","game_url":"https:\/\/www.freetogame.com\/open\/tarisland","genre":"MMORPG","platform":"PC (Windows)","publisher":"Tencent","developer":"Level Infinite","release_date":"2024-06-22","freetogame_profile_url":"https:\/\/www.freetogame.com\/tarisland"
