//
//  Model.swift
//  toDoList
//
//  Created by Мария on 16.10.2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import Foundation

var toDoItem: [String] = ["Do HW", "Call mammy"]

func addItem(_ name: String)  {
    toDoItem.append(name)
}

func removeItem(at index: Int) {
    toDoItem.remove(at: index)
}

