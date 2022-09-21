//
//  BigPictureViewController.swift
//  MobioSDKSwift
//
//  Created by Sun on 17/08/2022.
//

import UIKit

final class BigPictureViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    // MARK: - Data
    private func setupData() {
        titleLabel.text = "Big image titleBig image titleBig image titleBig image titleBig image titleBig image titleBig image titleBig image titleBig image titleBig image titleBig image title"
        bodyLabel.text = "Big picture bodyBig picture bodyBig picture bodyBig picture bodyBig picture bodyBig picture bodyBig picture bodyBig picture body"
        downloadImage(from: "https://koenig-media.raywenderlich.com/uploads/2020/04/RichPushNotifications-feature.png")
    }
    
    private func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if let data = data {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
