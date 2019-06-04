//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Parth Mangrola on 4/4/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//
class ChecklistItem: NSObject, Codable{
  var text = ""
  var checked = false
  
  func toggleChecked(){
    checked = !checked
  }
}



import Foundation
