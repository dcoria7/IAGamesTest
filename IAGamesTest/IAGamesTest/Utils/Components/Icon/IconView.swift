//
//  IconView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import SwiftUI

extension Image {
	init(icon: Icon) {
		self.init(icon.rawValue)
	}
}

struct IconView: View {
	var icon: Icon
	var renderingMode: Image.TemplateRenderingMode
	var hasBorder: Bool
	var overlaySize: CGFloat = 35
	
	init(
		_ icon: Icon,
		_ renderingMode: Image.TemplateRenderingMode =  .original,
		hasBorder: Bool = false
	) {
		self.icon = icon
		self.renderingMode = renderingMode
		self.hasBorder = hasBorder
	}
	
	var body: some View {
		Image(icon.rawValue)
			.resizable()
			.renderingMode(renderingMode)
			.aspectRatio(contentMode: .fit)
	}
}
