//
//  AdviceTableViewController.swift
//  CampApp
//
//  Created by Максим Лисица on 08/06/2019.
//  Copyright © 2019 Максим Лисица. All rights reserved.
//

import UIKit

class AdviceTableViewController: UITableViewController {
    
    var adviceArrayInJSON: Advices?
    
    @IBOutlet var adviceTableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar(withTitle: "Советы по походу", large: true)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        parseJSONAdvice(in: &adviceArrayInJSON)
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adviceArrayInJSON?.advice?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AdviceTableViewCell
        
        cell.labelAdvice.text = adviceArrayInJSON?.advice?[indexPath.row].title
        cell.imageViewAdvice.image = UIImage(named: adviceArrayInJSON?.advice?[indexPath.row].imagePath ?? "default")
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "fullAdviceSegue") {
            if let indexPath = self.adviceTableView.indexPathForSelectedRow{
                let adviceVC = segue.destination as! FullAdviceViewController
                
                adviceVC.textTitleLabel = adviceArrayInJSON?.advice?[indexPath.row].title ?? "Нет заголовка"
                adviceVC.textImageView = adviceArrayInJSON?.advice?[indexPath.row].imagePath ?? "default"
                adviceVC.textAboutLabel = adviceArrayInJSON?.advice?[indexPath.row].about ?? "Нет описания"
            }
        }
    }
    
}
