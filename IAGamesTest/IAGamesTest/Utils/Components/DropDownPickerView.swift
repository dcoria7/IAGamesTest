//
//  DropDownPickerView.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import Combine
import SwiftUI

enum DropDownPickerState {
	case top
	case bottom
}

struct DropDownPicker: View {
	
	@Binding var selection: String
	
	var state: DropDownPickerState = .bottom
	var options: [String]
	
	@State var showDropdown = false
	
	@SceneStorage("drop_down_zindex") private var index = 1000.0
	@State var zindex = 1000.0
	
	var body: some View {
		GeometryReader {
			let size = $0.size
			
			VStack(spacing: 0) {
				
				
				if state == .top && showDropdown {
					OptionsView()
				}
				
				HStack {
					Text(selection.isEmpty ? "Select Category" : selection)
						.foregroundColor(selection.isEmpty ? .white : .gray)
						.padding(.horizontal)
					
					Spacer(minLength: 0)
					
					Image(systemName: state == .top ? "chevron.up" : "chevron.down")
						.font(.title3)
						.foregroundColor(.white)
						.rotationEffect(.degrees((showDropdown ? -180 : 0)))
						.padding(.trailing, 20)
				}
				.frame(height: 50)
				.background(.black)
				.contentShape(.rect)
				.onTapGesture {
					index += 1
					zindex = index
					withAnimation(.snappy) {
						showDropdown.toggle()
					}
				}
				.zIndex(10)
				
				if state == .bottom && showDropdown {
					OptionsView()
				}
			}
			.clipped()
			.background(.black)
			.cornerRadius(15)
			.frame(height: size.height, alignment: state == .top ? .bottom : .top)
			
		}
		.frame(height: 80)
		.zIndex(zindex)
	}
	
	@ViewBuilder
	private func makeSeparator() -> some View {
		Rectangle()
			.foregroundColor(.clear)
			.frame(height: 1)
			.background(.white)
			.opacity(0.2)
	}
	
	func OptionsView() -> some View {
		VStack(spacing: 0) {
			ForEach(options, id: \.self) { option in
				HStack {
					Text(option)
						.foregroundStyle(.white)
					
					Spacer()
					Image(systemName: "checkmark")
						.opacity(selection == option ? 1 : 0)
				}
				.foregroundStyle(selection == option ? Color.white : Color.white)
				.animation(.none, value: selection)
				.frame(height: 50)
				.contentShape(.rect)
				.padding(.horizontal)
				.onTapGesture {
					withAnimation(.snappy) {
						selection = option
						showDropdown.toggle()
					}
				}
				
				makeSeparator()
					.padding(.horizontal)
			}
		}
		.transition(.move(edge: state == .top ? .bottom : .top))
		.zIndex(1)
	}
}
