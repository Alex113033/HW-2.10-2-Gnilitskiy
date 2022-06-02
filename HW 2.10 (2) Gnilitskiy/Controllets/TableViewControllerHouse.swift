//
//  TableViewControllerHouse.swift
//  HW 2.10 (2) Gnilitskiy
//
//  Created by Александр on 28.05.2022.
//

import UIKit
import Alamofire

class TableViewControllerHouse: UITableViewController{
    
    private var houses: [House] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transferHouse()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        houses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellHouses", for: indexPath) as! HouseTableViewCell
  
        let house = houses[indexPath.row]
        
        cell.nameCell.text = house.name ?? ""
        cell.regionCell.text = house.region ?? ""
        cell.coatOfArmsCell.text = house.coatOfArms ?? ""
        cell.wordsCell.text = house.words ?? ""
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Network
    
    private func transferHouse() {
           NetworkManager.networkManager.fetchHouses(Link.houses.rawValue) { result in
               switch result {
               case .success(let houses):
                   self.houses = houses
                   self.tableView.reloadData()
               case .failure(let error):
                   print(error)
               }
           }
       }
}
