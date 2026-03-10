//
//  JSONDECODER+Extensions.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import Foundation
import SwiftUI

// MARK: - Liquid Glass Pattern Helper
extension View {
	@ViewBuilder
	func applyGlassEffect(fallback: Material) -> some View {
		if #available(iOS 26, *) {
			self.glassEffect(.regular.interactive(), in: .rect(cornerRadius: 10))
		} else {
			self.background(fallback, in: .rect(cornerRadius: 10))
		}
	}
}
