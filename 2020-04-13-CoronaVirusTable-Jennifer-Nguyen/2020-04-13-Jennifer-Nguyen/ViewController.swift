//
//  ViewController.swift
//  2020-04-13-Jennifer-Nguyen
//
//  Created by Jennifer Nguyen on 4/9/20.
//  Copyright © 2020 Jennifer Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //set up data to be served into the  table
    let countryNameArray = ["United States", "Spain", "Italy", "Germany", "France", "China", "Iran", "United Kingdom", "Turkey", "Switzerland"]
    
    let totalCasesArray = ["451,491", "152,446", "143,626", "115,523", "83,080", "82,883", "66,220", "65,077", "42,282", "24,046"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self
    }


}

//extension
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalCasesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = countryNameArray[indexPath.row]
        
        cell.detailTextLabel?.text = "\(totalCasesArray[indexPath.row])"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            //creating a date object that is today
            let today = Date()
            //creating a DateFormatter object to format how the date should be displayed
            let formatter = DateFormatter()
            formatter.dateStyle = .short // .short means date will be displayed in dd/mm/yy
            formatter.timeStyle = .none // .none means no time will be displayed
    
            let date = formatter.string(from: today)  //format the date
            return "Virus Cases by Country on " + date
    }

}

