//
//  Checklist.swift
//  Checklists
//
//  Created by Parth Mangrola on 8/19/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import UIKit

class Checklist: NSObject {
  var name = ""
  
  init(name: String){
    self.name = name
    super.init()
  }
}
