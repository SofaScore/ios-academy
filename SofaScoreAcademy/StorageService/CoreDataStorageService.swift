//
//  CoreDataStorageService.swift
//  SofaScoreAcademy
//
//  Created by Kristian Vukušić on 12/05/2021.
//

import Foundation
import CoreData

class CoreDataStorageService: StorageService {

    private static let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    private func saveContext() {
        let context = Self.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

            }
        }
    }

    private func getSavedEntities() -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "EventEntity")
        let context = Self.persistentContainer.viewContext
        do {
            return try context.fetch(fetchRequest)
        } catch {
            return [NSManagedObject]()
        }
    }

    func getSavedEvents() -> [Event] {
        let eventEntities = getSavedEntities()
        var res = [Event]()
        for ev in eventEntities {
            guard let id = ev.value(forKey: "id") as? Int,
                  let homeTeamName = ev.value(forKey: "homeTeamName") as? String,
                  let awayTeamName = ev.value(forKey: "awayTeamName") as? String,
                  let startTimestamp = ev.value(forKey: "startTimestamp") as? Int else { continue }
            let event = Event(id: id,
                              homeTeamName: homeTeamName,
                              awayTeamName: awayTeamName,
                              startTimestamp: startTimestamp)
            res.append(event)
        }
        return res
    }

    func saveEvent(event: Event) {
        let context = Self.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "EventEntity", in: context) else { return }
        let eventEntity = NSManagedObject(entity: entity, insertInto: context)
        eventEntity.setValue(event.id, forKey: "id")
        eventEntity.setValue(event.startTimestamp, forKey: "startTimestamp")
        eventEntity.setValue(event.homeTeamName, forKey: "homeTeamName")
        eventEntity.setValue(event.awayTeamName, forKey: "awayTeamName")
        saveContext()
    }

    func deleteEvent(eventId: Int) {
        let context = Self.persistentContainer.viewContext
        let entity = getSavedEntities().first {
            guard let id = $0.value(forKey: "id") as? Int else { return false }
            return id == eventId
        }

        guard let eventEntity = entity else { return }
        context.delete(eventEntity)
        saveContext()
    }

    func isEventSaved(eventId: Int) -> Bool {
        getSavedEvents().contains {
            $0.id == eventId
        }
    }
}
