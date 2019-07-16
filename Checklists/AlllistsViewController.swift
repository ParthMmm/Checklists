//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Parth Mangrola on 7/16/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {
  
  let cellIdentifier = "ChecklistCell"

    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel!.text = "List \(indexPath.row)"

        return cell
    }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    performSegue(withIdentifier: "ShowChecklist", sender: nil)
  }
  

   
}
