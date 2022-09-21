//
//  RatingViewController.swift
//  RatingApp
//
//  Created by Sun on 19/08/2022.
//

import UIKit

//https://img.icons8.com/ios/344/star--v1.png
//https://img.icons8.com/external-becris-lineal-becris/344/external-star-celebration-becris-lineal-becris.png

final class RatingViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var ratingStackView: UIStackView!
    
    var ratingButtonArray = [UIButton]()
        
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        downLoadData()
    }
    
    // MARK: - Data
    private func downLoadData() {
        downloadImage(from: "https://image-us.eva.vn/upload/2-2020/images/2020-06-28/goi-y-6-mon-an-tuyet-ngon-cho-ngay-gia-dinh-viet-nam-nang-nong-may-cung-hap-dan-1-1593306532-161-width700height524.jpg") { [weak self] data in
            guard let self = self else { return }
            self.imageView.image = UIImage(data: data)
        }
        let group = DispatchGroup()
        var emptyStar: UIImage?
        group.enter()
        downloadImage(from: "https://img.icons8.com/dotty/344/star.png") { data in
            emptyStar = UIImage(data: data, scale: 10)
            group.leave()
        }
        var fullStar: UIImage?
        group.enter()
        downloadImage(from: "https://img.icons8.com/dusk/344/star--v1.png") { data in
            fullStar = UIImage(data: data, scale: 10)
            group.leave()
        }
        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.setupButtonArray(emptyStar: emptyStar, fullStar: fullStar)
        }
    }
    
    private func setupVoteStackView(with ratingButtonArray: [UIButton]) {
        ratingStackView.backgroundColor = .red
        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        ratingButtonArray.forEach { button in
            ratingStackView.addArrangedSubview(button)
        }
    }
    
    private func setupButtonArray(emptyStar: UIImage?, fullStar: UIImage?) {
        for index in 0..<5 {
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(fullStar, for: .selected)
            button.tintColor = .clear
            button.tag = index
            button.addTarget(self, action: #selector(ratingAction(_:)), for: .touchUpInside)
            ratingButtonArray.append(button)
        }
        setupVoteStackView(with: ratingButtonArray)
    }
    
    func downloadImage(from urlString: String, complete: @escaping (Data) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    complete(data)
                }
            }
        }.resume()
    }
    
    // MARK: - Action
    @objc func ratingAction(_ sender: UIButton) {
        changeStateButton(button: sender)
    }
    
    private func changeStateButton(button: UIButton) {
        for index in 0...button.tag {
            let button = ratingButtonArray[index]
            changeStateToSelected(button)
        }
        for index in button.tag+1..<ratingButtonArray.count {
            let button = ratingButtonArray[index]
            changeStateToNormal(button)
        }
    }
    
    private func changeStateToNormal(_ button: UIButton) {
        button.isSelected = false
    }
    
    private func changeStateToSelected(_ button: UIButton) {
        button.isSelected = true
    }
}
