//
//  ViewController.swift
//  Contacts
//
//  Created by Thiago Garcia on 08/04/18.
//  Copyright © 2018 iGarcia. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    let names = [
        "Amy", "Bill", "Zack", "Steve", "Jack", "Jill", "Mary"
    ]
    
    let cNames = [
        "Carl", "Chris", "Christina", "Cameron"
    ]
    
    let dNames = [
        "David", "Dan"
    ]
    
    let twoDimensionalArray = [
        ["Amy", "Bill", "Zack", "Steve", "Jack", "Jill", "Mary"],
        ["Carl", "Chris", "Christina", "Cameron"],
        ["David", "Dan"],
        ["Patrick", "Patty"]
    ]
    
    var showIndexPaths = false

    @objc func handleShowIndexPath() {
        var indexPathsToReload = [IndexPath]()
        
        for section in twoDimensionalArray.indices {
            for row in twoDimensionalArray[section].indices {
                let indexPath = IndexPath(row: row, section: section)
                indexPathsToReload.append(indexPath)
            }
        }
        
        showIndexPaths = !showIndexPaths
        
        let animationStyle = showIndexPaths ? UITableViewRowAnimation.right : .left
        
        tableView.reloadRows(at: indexPathsToReload, with: animationStyle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
       
        title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twoDimensionalArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let name = twoDimensionalArray[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = name
        
        if showIndexPaths {
            cell.textLabel?.text = "\(name) Section:\(indexPath.section) Row:\(indexPath.row)"
        }

        return cell
    }
}
