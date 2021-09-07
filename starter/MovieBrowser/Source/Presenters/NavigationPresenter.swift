//
//  NavigationPresenter.swift
//
//  Created by Khateeb Mahad H. on 8/19/21.
//

import UIKit

protocol NavigationPresenter_Proto {
    func navigate(from: UIViewController, destination: UIViewController, title: String?, animated: Bool)
    func hideNavBar(from: UIViewController, isHidden: Bool)
    func navigateToMovieDetail(from: UIViewController, movie: Movie)
}

class NavigationPresenter: NavigationPresenter_Proto {
    func navigate(from: UIViewController, destination: UIViewController, title: String?, animated: Bool) {
        if let navController = from.navigationController {
            destination.title = title
            navController.pushViewController(destination, animated: animated)
        }
        else {
            destination.title = title
            from.present(UINavigationController(rootViewController: destination), animated: animated)
        }
    }
    
    func hideNavBar(from: UIViewController, isHidden: Bool) {
        if let navController = from.navigationController {
            navController.isNavigationBarHidden = isHidden
        }
    }
    
    func navigateToMovieDetail(from: UIViewController, movie: Movie) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "movieDetailVC") as! MovieDetailViewController
        vc.movieModel = movie
        navigate(from: from, destination: vc, title: nil, animated: true)
    }
    
}

