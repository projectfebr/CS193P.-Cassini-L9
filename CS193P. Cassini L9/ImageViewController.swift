//
//  ImageViewController.swift
//  CS193P. Cassini L9
//
//  Created by Александр Болотов on 07.12.2020.
//

import UIKit

class ImageViewController: UIViewController {
    var imageURL: URL? {
        didSet {
            imageView.image = nil
            if view.window != nil { // если view нет на экране - то нет смысле в затратной операции выборки
                fetchImage()
            }
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
}
