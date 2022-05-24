//
//  TableViewControllerPerson.swift
//  HW 2.10 (2) Gnilitskiy
//
//  Created by Александр on 19.05.2022.
//

import UIKit

class TableViewControllerPerson: UITableViewController{
    
    private var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transfer()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let book = books[indexPath.row]
        content.text = book.name
        content.secondaryText = "- \(book.numberOfPages ?? 0) pages"
        
        cell.contentConfiguration = content
        return cell
    }
    
    private func transfer() {
        NetworkManager.networkManager.fetchBooks { books in
            DispatchQueue.main.async {
                self.books = books
                self.tableView.reloadData()
            }
        }
    }
}
