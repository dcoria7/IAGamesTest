//
//  NetworkAPI.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation

class NetworkAPI: NSObject {
	let apiURL: URL
	let networkManager: NetworkManager
	
	init(requestURL: URL, networkManager: NetworkManager) {
		self.apiURL = requestURL
		self.networkManager = networkManager
	}
	
	func parseData<T: Decodable>(data: Data) throws -> T{
		guard let decodedData = try? JSONDecoder().decode(T.self, from: data)
		else {
			throw NSError(
				domain: "NetworkAPIError",
				code: 3,
				userInfo: [NSLocalizedDescriptionKey: "JSON decode error"]
			)
		}
		return decodedData
	}
	
	func getRequest() async throws -> [GameModel] {
		do {
			let data = try await networkManager.requestGET(url: apiURL)
			return try self.parseData(data: data)
		} catch let error {
			print("error fetching data")
			print(error.localizedDescription)
			throw error
		}
	}
	
}
