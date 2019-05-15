//
//  ViewController.swift
//  TWTask
//
//  Created by Farhan Tahir on 10/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    let viewModel = PostListViewModel()
    @IBOutlet weak var tableView: UITableView!
    var selectedIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.posts.bind { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.fetchAllPosts()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? PostsDetailsViewController {
            controller.post = viewModel.posts.value[selectedIndex]
        }
    }

}

extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell {
            let viewModel = self.viewModel.posts.value[indexPath.row]
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
