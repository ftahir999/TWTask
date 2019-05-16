//
//  ViewController.swift
//  TWTask
//
//  Created by Farhan Tahir on 10/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import UIKit
import Common

class PostsViewController: UIViewController, Instantiatable {

    let viewModel = PostListViewModel(dataProvider: DataProvider())
    @IBOutlet weak var tableView: UITableView!
    var selectedIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.postsVMs.bind { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.fetchAllPosts()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? PostsDetailsViewController {
            controller.post = viewModel.postsVMs.value[selectedIndex].model
        }
    }

}

extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.postsVMs.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell {
            let viewModel = self.viewModel.postsVMs.value[indexPath.row]
            cell.bindViewModel(viewModel: viewModel)
            return cell
        }
        assertionFailure("Cell Wasn't Deqeue")
        return UITableViewCell()
    }
}

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       selectedIndex = indexPath.row
    }
}
