//
//  JSONDECODER+Extensions.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation

extension JSONDecoder {
	static let shared: JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		decoder.dateDecodingStrategy = .iso8601
		return decoder
	}()
}

extension Data {
	func decodedObject<T: Decodable>() throws -> T {
		try JSONDecoder.shared.decode(T.self, from: self)
	}
}

