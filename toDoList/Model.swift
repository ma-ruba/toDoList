//
//  Model.swift
//  toDoList
//
//  Created by Мария on 15.10.2019.
//  Copyright © 2019 Мария. All rights reserved.
//

//Это паттерн проектирования MVC

//вся логика приложения: сохранение данных, подгрузка данных, создание новых toDoItemов

import Foundation

var toDoItems: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "toDoDataKey")
        UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "toDoDataKey") as? [[String: Any]] {
            return array
        } else {
           return []
        }
    }
}

func addItem(nameItem: String, isCompleated: Bool = false) {
    toDoItems.append(["Name" : nameItem, "Is compleated" : isCompleated])
}

func removeItem(at index: Int) {
    toDoItems.remove(at: index)
}

func changeStatus(at index: Int) -> Bool {
    toDoItems[index]["Is compleated"] = !(toDoItems[index]["Is compleated"] as! Bool)
    return toDoItems[index]["Is compleated"] as! Bool
}
