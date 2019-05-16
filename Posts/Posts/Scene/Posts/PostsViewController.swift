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
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: PostListViewModel!
    var router: PostsRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayAllPosts()
    }
    
    private func displayAllPosts() {
        viewModel.postsVMs.bind { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.fetchAllPosts()
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
       let post = viewModel.postsVMs.value[indexPath.row].model
        router.pushPostDetailsVC(post: post)
    }
}
