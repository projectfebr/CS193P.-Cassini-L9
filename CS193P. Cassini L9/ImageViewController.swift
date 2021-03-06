//
//  ImageViewController.swift
//  CS193P. Cassini L9
//
//  Created by Александр Болотов on 07.12.2020.
//

import UIKit

class ImageViewController: UIViewController {
    var imageView = UIImageView()
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil { // если view нет на экране - то нет смысле в затратной операции выборки
                fetchImage()
            }
        }
    }
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
 
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                image = UIImage(data: imageData)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if imageURL == nil {
//            imageURL = DemoURLs.stanford
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
}

extension ImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
