//
//  Task.swift
//  TodoListA2
//
//  Created by Gerson Isaias on 19/02/21.
//

import UIKit

class Task: Codable {
    var name:String!
    public private(set) var done:Bool = false
    
    init(_ name:String) {
        self.name = name
    }
    
    func store(){
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(App.shared.tasks)
            App.shared.defaults.setValue(data, forKey: "tasks")
            App.shared.defaults.synchronize()
        }catch{
            print("Error de serializacion;: \(error)")
        }
    }
    
    func add(){
        App.shared.tasks = Task.all()
        App.shared.tasks.append(self)
        
        self.store()
    }
    
    static func all() -> [Task]{
        if let data = App.shared.defaults.object(forKey: "tasks") as? Data {
            
            let decoder = JSONDecoder()
            guard let tasks = try? decoder.decode([Task].self, from: data) else {
                return [Task]()
            }
            return tasks
            
        }
        return [Task]()
    }
    
    func wasDone(index:Int){
        App.shared.tasks = Task.all()
        self.done = true
        App.shared.tasks[index] = self
        
        self.store()
    }
}

