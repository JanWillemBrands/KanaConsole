//
//  ContentView.swift
//  Shared
//
//  Created by Johannes Brands on 04/05/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    func generateBackgroundColor(from id: UUID) -> Color {
        let bytes16 = id.uuid
        let r = Double(bytes16.1) / 255
        return Color(hue: r, saturation: 0.7, brightness: 1.0, opacity: 0.5)
    }
    
    func generateForegroundColor(from id: UUID) -> Color {
        let bytes16 = id.uuid
        let r = Double(bytes16.1) / 255
        return Color(hue: r, saturation: 0.5, brightness: 1.0, opacity: 1.0)
    }
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TestItem.timestamp, ascending: false)]
    ) private var items: FetchedResults<TestItem>
    
    var sortedItems: [TestItem] {
        return items.sorted(using: sortOrder)
    }
    
    @State private var selection: Set<TestItem.ID> = []
    
    //    @State private var sortOrder = [KeyPathComparator(\TestItem.timestamp), KeyPathComparator(\TestItem.rightanswer)]
//    @State private var sortOrder = [KeyPathComparator(\TestItem.timestamp, order: .reverse)]
    @State private var sortOrder = [KeyPathComparator(\TestItem.timestamp)]

    var body: some View {
        
#if os(macOS)
        
        // NavigationSplitView
        Table(sortedItems, selection: $selection, sortOrder: $sortOrder) {
            TableColumn("session") { item in
                Text(item.session?.description ?? "N/A")
                    .foregroundColor(generateForegroundColor(from: item.session!))
            }
            .width(min: 100, ideal: 200, max: 400)
            
            TableColumn("timestamp") { item in
                Text(item.timestamp?.description ?? "N/A")
            }
            
            TableColumn("rightanswer", value: \.rightanswer) { item in
                Text(item.rightanswer.description)
            }
            .width(min: 10, ideal: 50, max: 100)

            TableColumn("givenanswer", value: \.givenanswer) { item in
                Text(item.givenanswer.description)
                    .foregroundColor(item.givenanswer == item.rightanswer ? Color.primary : Color.red)
            }
            .width(min: 10, ideal: 50, max: 100)

            TableColumn("mode", value: \.mode.rawValue) { item in
                Text(item.mode.rawValue)
            }
            .width(min: 10, ideal: 50, max: 100)

            TableColumn("choices") { item in
                Text("\(item.altanswer0), \(item.altanswer1), \(item.altanswer2)")
            }
        }
        .preferredColorScheme(.dark)
        .onDeleteCommand { deleteSelection() }
        
#elseif os(iOS)
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(items, id: \.self) { item in
                    HStack {
                       Text(item.timestamp!, formatter: itemFormatter)
                            .background(generateBackgroundColor(from: item.session!))
                            .padding(.trailing)
                        Text(item.rightanswer.description)
                            .padding(.trailing)
                        Text(item.givenanswer.description)
                            .foregroundColor(item.givenanswer == item.rightanswer ? Color.primary : Color.red)
                            .padding(.trailing)
                        Text(item.mode.rawValue)
                    }
                    .font(.system(size: 16, design: .monospaced))
                }
            }
        }
        .padding()
        
//        NavigationView {
//            List(selection: $selection) {
//                ForEach(items, id: \.self) { item in
//                    //                    Text("\(item.timestamp!, formatter: itemFormatter)")
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
////                                .font(.footnote)
//                }
//                .onDelete { indexes in
//                    deleteItems(indexes)
//                }
//            }
//
//            .navigationTitle("Test History")
//
//            .toolbar {
//                ToolbarItem(placement: .primaryAction) {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//                ToolbarItem(placement: .principal) {
//                    Button(action: deleteSelection ) {
//                        Label("Delete selection", systemImage: "trash")
//                    }
//                    .disabled(selection == [])
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//            }
//        }
//        Text("\(selection.count) selections")
        
#endif
        
    }
    
    
    private func addItem() {
        let newItem = TestItem(context: viewContext)
        newItem.timestamp = Date()
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            let error = error as NSError
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    private func deleteSelection() {
        items.filter { item in selection.contains(item.id) }
            .forEach(viewContext.delete)
        //        let offsets = IndexSet(selection.compactMap { s in items.firstIndex(of: s) } )
        //        deleteItems(offsets: offsets)
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            let error = error as NSError
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        selection = []
    }
    
#if os(iOS)
    private func deleteItems(_ indexes: IndexSet) {
        //                items.filter { item in selection.contains(item.id) }
        //                    .forEach(viewContext.delete)
        indexes.map { items[$0] }
            .forEach(viewContext.delete)
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        selection = []
    }
#endif
    
    //#elseif os(iOS)
    //    private func deleteItems() {
    //        withAnimation {
    //            items.filter { item in selection.contains(item.id) }
    //                .forEach(viewContext.delete)
    //            //            selection.map { items[$0] }
    //            //                .forEach(viewContext.delete)
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //        selection = []
    //    }
    //#endif
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

}

//struct ExampleView: View {
//    @State var fruits = ["🍌", "🍏", "🍑"]
//    
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(fruits, id: \.self) { fruit in
//                    Text(fruit)
//                }
//                .onDelete { offsets in
//                    fruits.remove(atOffsets: offsets)
//                }
//            }
//            .toolbar {
//                EditButton()
//            }
//        }
//    }
//}
