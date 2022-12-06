//
//  RandomModesViewController.swift
//  AnyRandom
//
//  Created by Вячеслав Горбатенко on 05.12.2022.
//

import UIKit
  
class RandomModesViewController: UITableViewController {
    
    // MARK: - Private Properties
    
    private let randomModes = RandomMode.getRandomModes()
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }

    // MARK: - Table View Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        randomModes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomMode", for: indexPath)
        let randomMode = randomModes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = randomMode.title
        content.secondaryText = randomMode.description
        content.image = UIImage(named: randomMode.image)
        content.imageProperties.maximumSize = CGSize(width: 40, height: 40)
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let randomMode = randomModes[indexPath.row]
        performSegue(withIdentifier: randomMode.segueIdentifier, sender: nil)
    }

}
