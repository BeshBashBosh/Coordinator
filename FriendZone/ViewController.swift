//
//  ViewController.swift
//  FriendZone
//
//  Created by beshbashbosh on 13/01/2019.
//  Copyright © 2019 beshbashbosh. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - Properties
    var friends = [Friend]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        title = "Friend Zone"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFriend))
    }

    // MARK: - TableView
    override func tableView(_ tableView: UITableView,
                         numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView,
                         cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.timeZone.identifier
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        configure(friend: friends[indexPath.row], position: indexPath.row)
    }
    
    // MARK: - API
    func loadData() {
        let defaults = UserDefaults.standard
        guard let saveData = defaults.data(forKey: "Friends") else { return }
        
        let decoder = JSONDecoder()
        guard let savedFriends = try? decoder.decode([Friend].self, from: saveData) else { return }
        
        friends = savedFriends
    }
    
    func saveData() {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        
        guard let savedData = try? encoder.encode(friends) else {
            fatalError("Unable to encode friends data")
        }
        
        defaults.set(savedData, forKey: "Friends")
    }
    
    @objc func addFriend() {
        let friend = Friend()
        friends.append(friend)
        tableView.insertRows(at: [IndexPath(row: friends.count - 1, section: 0)],
                        with: .bottom)
        
        configure(friend: friend, position: friends.count - 1)
    }
    
    // MARK: - Navigation
    func configure(friend: Friend, position: Int) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FriendViewController") as? FriendViewController else {
            fatalError("Unable to create FriendViewController")
        }
        
        vc.delegate = self
        vc.friend = friend
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

