//
//  Model.swift
//  toDoList
//
//  Created by Мария on 16.10.2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import Foundation

var toDoItem: [[String: Any]] {
    set { //вызывается при попытке изменения 
        UserDefaults.standard.set(newValue, forKey: "toDoKey")
        UserDefaults.standard.synchronize()
    }
    get { //вызывается при обращении
        if let array = UserDefaults.standard.array(forKey: "toDoKey") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
    
}
func addItem(_ name: String, isDone: Bool = false)  {
    
    toDoItem.append(["Name" : name as Any, "Is done" : isDone as Any])
}

func removeItem(at index: Int) {
    toDoItem.remove(at: index)
}

func changeStatus(at index: Int) -> Bool {
    toDoItem[index]["Is done"] = !(toDoItem[index]["Is done"] as! Bool)
    return toDoItem[index]["Is done"] as! Bool
}

func moveItem(from: Int, to: Int) {
    let item = toDoItem[from]
    toDoItem.remove(at: from)
    toDoItem.insert(item, at: to)
}
