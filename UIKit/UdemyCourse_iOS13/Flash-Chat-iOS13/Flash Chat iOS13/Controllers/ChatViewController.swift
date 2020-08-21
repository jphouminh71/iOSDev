//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//


/*    notes
    Tasks held in the background are not using the main thread.
    Updates to the UI must be done with the main thread.
 
 
 
 */

import UIKit
import Firebase
class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        // registering our custom xib file
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
    }
    
    
    /* if this reloads the db every time, this is really bad in runtime O(n). */
    func loadMessages(){
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { (querySnapshot, error) in
            if let e = error{
                print("Error retrieving from db: \(e)")
            }else{
                self.messages = []
                // query Snapshot has the data , we need to filter it based on the current user
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String{
                            let newMessage: Message = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            // we have to use the main thread to update data because it is the one hitting the UI
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    /* when they send we will store it in a db */
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text , let messageSender = Auth.auth().currentUser?.email{
            // now we want to write to the db
            db.collection(K.FStore.collectionName).addDocument(data:    // This is how documents are stored in the db
                [K.FStore.senderField: messageSender ,
                 K.FStore.bodyField: messageBody ,
                 K.FStore.dateField: Date().timeIntervalSince1970
                ])
            { (error) in
                    if let e = error{
                        print("Something went wrong in the db: \(e)")
                    }else{
                        print("Data saved successfully.")
                        
                        DispatchQueue.main.async {
                            self.messageTextfield.text = ""
                        }
                    }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError{
            print("error signing out user \(signOutError)")
        }
    }
}

// the following code allows us to populate the table view
extension ChatViewController: UITableViewDataSource{
    
    // how many rows do you want in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    // giving access to each cell in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        let cell: MessageCell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        cell.label?.text = message.body
        
        // this is a message from the current user
        if message.sender == Auth.auth().currentUser?.email{
            print("here")
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightBlue)
            
        }
        // this a message from a another sender
        else{
            print("nope over here")
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.label.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        
        
        return cell
    }
}


// this code lets us recieve input from the user when they tap on a certain row
//extension ChatViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//    }
//}
