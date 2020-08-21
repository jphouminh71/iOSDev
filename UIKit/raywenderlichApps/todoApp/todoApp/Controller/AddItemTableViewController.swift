//
//  AddItemTableViewController.swift
//  todoApp
//
//  Created by Jonathan Phouminh on 7/11/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

// any view that wants to get an item added must conform to this protocol
protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: ItemDetailV)  // a function whos parameter passes a referene to the class that has the data we want
    func addItemViewController(_ controller: ItemDetailV, didFinishAdding item: ChecklistItem)
    func addItemViewController(_ controller: ItemDetailV, didFinishEditiing item: ChecklistItem)
}

class ItemDetailV: UITableViewController {
    
    weak var mydelegate: AddItemViewControllerDelegate?        // this is anything that conforms to the protocol
    
    // attributes that we will use to make edits
    weak var todoList: TodoList?
    weak var itemToEdit: ChecklistItem? 
    
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        inputTextField.delegate = self    // need to do this to be able to use UITextField delegate methods
        inputTextField.becomeFirstResponder()
    }
    
    func configureNavigationBar(){
        navigationItem.largeTitleDisplayMode = .never
        if let _ = itemToEdit {
            navigationItem.title = "Edit Item"
        }else{
            navigationItem.title = "Add Item"
        }
        
        
        // creating the buttons
        let cancelBtn: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel))
        let DoneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done))
        
        // placing the buttons on the navigation bar
        navigationItem.leftBarButtonItem = cancelBtn
        navigationItem.rightBarButtonItem = DoneBtn
        
    }
    /// navigation button action methods
    @objc func cancel(){
        mydelegate?.addItemViewControllerDidCancel(self)    // "hey delegate, call this protocol method and i will give you a reference to myself"
    }
    @objc func done(){   //   THIS IS WHERE WE PASS THE ITEM BACK TO THE DELEGATE
        
        if let item = itemToEdit, let text = inputTextField.text{
            item.text = text
            mydelegate?.addItemViewController(self, didFinishEditiing: item)
        }
        else{
            let item = ChecklistItem()
            if let textFieldText: String = inputTextField.text {
                item.text = textFieldText
                item.checked = false
            }
            
            mydelegate?.addItemViewController(self, didFinishAdding: item) // "hey delegate, call this protocol method and i will give you a reference to the item"
        }
        
                
    }
    
    func configureTextField(){
        inputTextField.autocapitalizationType = UITextAutocapitalizationType.sentences   // auto captializing sentences
        inputTextField.returnKeyType = UIReturnKeyType.done
        inputTextField.borderStyle = UITextField.BorderStyle.none
        
        if let item = itemToEdit {
            inputTextField.text = item.text
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // we are making the user unable to select the row that encapsulates the text field
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

// We can react to UITextField events by becoming its delegate and implementing some of the functions
//  all a delegate is is something that gets assigned to handle actions that are provided by the protocol
extension ItemDetailV: UITextFieldDelegate {
    
    // this function is triggered when the user taps on the return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        done()
        return false   // we make this false because we don't want this functions default implementation behavior
    }
    
    // this function gets called everytime a user hits a key on the keyboard
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text , let stringRange = Range(range, in:oldText) else {
            return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        // if the text is empty, then we want to disable the top right button, otherwise we will have it neabled
        
        // first we need to get the top right button since we setting it programatically.
        if let addBtn: UIBarButtonItem = navigationItem.rightBarButtonItem {
            if newText.isEmpty {
                addBtn.isEnabled = false
            }
            else{
                addBtn.isEnabled = true
            }
        }
        return true
    }
}
