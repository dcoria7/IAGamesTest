//
//  Extensions.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
	func unique() -> [Iterator.Element] {
		var seen: Set<Iterator.Element> = []
		return filter { seen.insert($0).inserted }
	}
}
