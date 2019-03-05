//
//  EntryController.swift
//  CreativeJournalApp
//
//  Created by Jack Knight on 3/4/19.
//  Copyright © 2019 Jack Knight. All rights reserved.
//

import Foundation


class EntryController: Codable {
    
    //Source of truth
    var entries: [Entry] = []
    
    //Shared instance
    static let shared = EntryController()
    
    //Crud Functions
    
    func addEntry(title: String, text: String) {
        
        let newEntry = Entry(title: title, text: text)
        entries.append(newEntry)
        saveToPersistentStorage()
    }
    
    func remove(entry: Entry) {
        if let removeEntry = entries.index(of: entry) {
            entries.remove(at: removeEntry)
            saveToPersistentStorage()
        }
    }

    func update(entry: Entry, title: String, text: String) {
        entry.title = title
        entry.text = text
        saveToPersistentStorage()
        
    }
    
    private func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "entry.json"
        let documentDirectoryURl = paths[0].appendingPathComponent(fileName)
        return documentDirectoryURl
    }
    
    func saveToPersistentStorage() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(entries)
            try data.write(to: fileURL())
        } catch let error {
            print(error)
        }
    }
    
    func loadFromPersistentStorage() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let entries = try decoder.decode([Entry].self, from: data)
            self.entries = entries
        } catch {
            print (error)
        }
    }
    
    
}
