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
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllPosts()
    }
    
    // Private
    private func fetchAllPosts() {
        viewModel.postsVMs.bind { [weak self] (_) in
            self?.tableView.reloadData()
        }
        viewModel.isLoadingData.bind { [weak self] in
            $0 ? self?.displayActivityIndicator() : self?.hideActivityIndicator()
        }
        
        viewModel.displayErrorMessage.bind { [weak self] (_) in
            self?.displayPostsNotAvailableErrorMessage()
        }
        viewModel.fetchAllPosts()
    }
    
    private func displayActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
    }
    
    private func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    private func displayPostsNotAvailableErrorMessage() {
        let errorMessage = viewModel.getPostsNotAvailableErrorMessage()
        let controller = UIAlertController.init(title: errorMessage.title, message: errorMessage.message, preferredStyle: .alert)
        let action = UIAlertAction.init(title: errorMessage.actionText, style: .default, handler: nil)
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }

}

extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.postsVMs.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: PostTableViewCell.self), for: indexPath) as? PostTableViewCell {
            let viewModel = self.viewModel.postsVMs.value[indexPath.row]
            cell.bindViewModel(viewModel: viewModel)
            return cell
        }
        assertionFailure("PostTableViewCell wasn't deqeue")
        return UITableViewCell()
    }
}

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let post = viewModel.postsVMs.value[indexPath.row].model
        router.pushPostDetailsVC(post: post)
    }
}
