//
//  itemDetailViewController.swift
//  Checklists
//
//  Created by Parth Mangrola on 4/8/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import UIKit

protocol itemDetailViewControllerDelegate: class{
  func itemDetailViewControllerDidCancel(
    _ controller: ItemDetailViewController)
  
  func itemDetailViewController(
    _ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
  
  func itemDetailViewController(
    _ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
  
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {

  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  var itemToEdit: ChecklistItem?
  weak var delegate: itemDetailViewControllerDelegate?
  
  override func viewDidLoad() {
    if let item = itemToEdit{
      title = "Edit Item"
      textField.text = item.text
      doneBarButton.isEnabled = true
    }
    super.viewDidLoad()
    
  }
  
  //MARK:= Actions
  
  @IBAction func cancel(){
    delegate?.itemDetailViewControllerDidCancel(self)
  }
  
  @IBAction func done(){
    
    if let item = itemToEdit {
      item.text = textField.text!
      delegate?.itemDetailViewController(self, didFinishEditing: item)
    }
    else{
      let item = ChecklistItem()
      item.text = textField.text!
      delegate?.itemDetailViewController(self, didFinishAdding: item)
    }
    
    
    
    
  }
  
  //MARK:- Table View Delegates
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    //MARK:- Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) ->
        Bool{
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        if newText.isEmpty{
            doneBarButton.isEnabled = false
        }
        else{
            doneBarButton.isEnabled = true
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }

}
