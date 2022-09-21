//
//  ViewController.swift
//  BigPictureApp
//
//  Created by sun on 21/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goBigPicture() {
        let viewController = BigPictureViewController()
        present(viewController, animated: true)
    }
    
    @IBAction func goRating(_ sender: Any) {
        let viewController = RatingViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
