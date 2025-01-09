//
//  EditGameFieldView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import SwiftUI

struct EditGameFieldView: View {
	let title: String
	let placeholder: String
	let axis: Axis
	
	@Binding var text: String
	
	var body: some View {
		HStack {
			Text(title)
				.padding(.leading, 8)
				.frame(width: 100, alignment: .leading)
				.fontWeight(.bold)
			
			VStack {
				TextField(placeholder, text: $text, axis: axis)
				Divider()
			}
		}
		.font(.subheadline)
	}
}
