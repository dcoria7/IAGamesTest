//
//  FetchRequest.swift
//  IAGamesTest
//
//  Created by DC on 08/01/25.
//

import SwiftUI
import CoreData

struct DynamicFetchRequestView<T: NSManagedObject, Content: View>: View {
	
	// That will store our fetch request, so that we can loop over it inside the body.
	// However, we don’t create the fetch request here, because we still don’t know what we’re searching for.
	// Instead, we’re going to create custom initializer(s) that accepts filtering information to set the fetchRequest property.
	@FetchRequest var fetchRequest: FetchedResults<T>
	
	// this is our content closure; we'll call this once the fetch results is available
	let content: (FetchedResults<T>) -> Content
	
	var body: some View {
		self.content(fetchRequest)
	}
	
	// This is a generic initializer that allow to provide all filtering information
	init( withPredicate predicate: NSPredicate, andSortDescriptor sortDescriptors: [NSSortDescriptor] = [],  @ViewBuilder content: @escaping (FetchedResults<T>) -> Content) {
		_fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: predicate)
		self.content = content
	}
	
	// This initializer allows to provide a complete custom NSFetchRequest
	init( withFetchRequest request:NSFetchRequest<T>,  @ViewBuilder content: @escaping (FetchedResults<T>) -> Content) {
		_fetchRequest = FetchRequest<T>(fetchRequest: request)
		self.content = content
	}
	
}

// Initializer for Account filtering
extension DynamicFetchRequestView where T : Game {
	
	init( withSearchText searchText: String, category: String, @ViewBuilder content: @escaping (FetchedResults<T>) -> Content) {
		let title = NSPredicate(format: "title CONTAINS[c] %@", searchText)
		let genre = NSPredicate(format: "genre CONTAINS[c] %@", category)
		
		if !searchText.isEmpty && category.isEmpty {
			let title = NSPredicate(format: "title CONTAINS[c] %@", searchText)
			self.init( withPredicate: title, content: content)
		} else if searchText.isEmpty && !category.isEmpty {
			let genre = NSPredicate(format: "genre CONTAINS[c] %@", category)
			self.init( withPredicate: genre, content: content)
		} else {
			let andCompoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates:
															[title,genre])
			self.init( withPredicate: andCompoundPredicate, content: content)
		}
		
		
	}
}
