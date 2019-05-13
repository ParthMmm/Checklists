//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Parth Mangrola on 4/8/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class{
  func addItemViewControllerDidCancel(
    _ controller: AddItemViewController
)
  func addItemViewController(
    _ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
  
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
  weak var delegate: AddItemViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
  //MARK:= Actions
  
  @IBAction func cancel(){
    delegate?.addItemViewControllerDidCancel(self)
  }
  
  @IBAction func done(){
    let item = ChecklistItem()
    item.text = textField.text!
    
    delegate?.addItemViewController(self, didFinishAdding: item)
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
