//
//  ContentView.swift
//  Shared
//
//  Created by Johannes Brands on 04/05/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TestItem.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<TestItem>
    
    @State private var sortOrder = [KeyPathComparator(\TestItem.rightanswer)]
    
#if os(macOS)
    @State private var selection: Set<TestItem.ID> = []
    
    var body: some View {
        Table(items, selection: $selection) {
            TableColumn("session") { item in
                if let s = item.session {
                    Text("\(s.uuidString)")
                } else {
                    Text("N/A")
                }
            }
            TableColumn("timestamp") { item in
                if let t = item.timestamp {
                    Text("\(t, formatter: itemFormatter)")
                } else {
                    Text("N/A")
                }
            }
            TableColumn("rightanswer") { item in Text("\(item.rightanswer.description)") }
            TableColumn("givenanswer") { item in
                Text("\(item.givenanswer.description)")
                    .foregroundColor(item.givenanswer == item.rightanswer ? Color.primary : Color.red)
            }
            TableColumn("choices") { item in
                Text("\(item.choices.description)")
                
            }
            TableColumn("mode") { item in
                Text("\(item.mode.description)")
                
            }
        }
        .contextMenu { Button("Delete") { deleteSelection() } }
        
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
            ToolbarItem(placement: .principal) {
                Button(action: deleteSelection ) {
                    Label("Delete selection", systemImage: "trash")
                }
                .disabled(selection == [])
            }
        }
        
        .onDeleteCommand { deleteSelection() }
    }
#elseif os(iOS)
    @State private var selection: Set<TestItem.ID> = []
    
    var body: some View {
        NavigationView {
            List(selection: $selection) {
                ForEach(items, id: \.self) { item in
//                    Text("\(item.timestamp!, formatter: itemFormatter)")
                                        NavigationLink {
                                            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                        } label: {
                                            Text(item.timestamp!, formatter: itemFormatter)
                                        }
                }
            }
            .navigationTitle("Test History")
//            .onDelete(perform: deleteItems)

            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Button(action: deleteItems ) {
                        Label("Delete selection", systemImage: "trash")
                    }
                    .disabled(selection == [])
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
        Text("\(selection.count) selections")
    }
#endif
    
    private func addItem() {
        withAnimation {
            let newItem = TestItem(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    #if os(macOS)
    private func deleteSelection() {
        items.filter { item in selection.contains(item.id) }
            .forEach(viewContext.delete)
        //        let offsets = IndexSet(selection.compactMap { s in items.firstIndex(of: s) } )
        //        deleteItems(offsets: offsets)
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let error = error as NSError
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        selection = []
    }
    #elseif os(iOS)
    private func deleteItems() {
        withAnimation {
            items.filter { item in selection.contains(item.id) }
                .forEach(viewContext.delete)
//            selection.map { items[$0] }
//                .forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        selection = []
    }
    #endif
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

public enum KanaMode: Int, Codable, CaseIterable {
    case H2R, K2R, R2H, R2K, H2K, K2H
    static let hiraganaModes: Set<KanaMode> = [H2R, R2H, H2K]
    static let katakanaModes: Set<KanaMode> = [K2R, R2K, K2H]
    static func random() -> KanaMode { allCases.randomElement()! }
    var description: String { String(describing: self) }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
