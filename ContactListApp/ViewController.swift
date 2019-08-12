//
//  ViewController.swift
//  ContactListApp
//
//  Created by IMCS2 on 8/12/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success{
                print("Authorization succesful")
            }
        }
        fetchContacts()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let contactToDisplay = contacts[indexPath.row]
        cell.textLabel?.text = contactToDisplay.givenName + " " + contactToDisplay.familyName
        cell.detailTextLabel?.text = contactToDisplay.number
        
        return cell
    }
    
    func fetchContacts(){
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request  = CNContactFetchRequest(keysToFetch: key)
        try! contactStore.enumerateContacts(with: request) { (contact, stoppingPointer) in
            let name = contact.givenName
            let familyName = contact.familyName
            let number = contact.phoneNumbers.first?.value.stringValue
            
            let contactToAppend = ContactStruct(givenName: name, familyName: familyName, number: number!)
            self.contacts.append(contactToAppend)
        }
        tableView.reloadData()
        print(contacts.first?.givenName)
    }
    
    
    
}

