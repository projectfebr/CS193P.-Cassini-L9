//
//  CassiniViewController.swift
//  CS193P. Cassini L9
//
//  Created by Александр Болотов on 07.12.2020.
//

import UIKit

class CassiniViewController: UIViewController {

    override func awakeFromNib() {
        print(#function)
        splitViewController?.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if let url = DemoURLs.NASA[identifier] {

                if let imageVC = segue.destination.contents as? ImageViewController {
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }
    
}

extension UIViewController {
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else if let tabcon = self as? UITabBarController  {
            return tabcon.selectedViewController ?? self
        }
        else {
            return self
        }
    }
}

extension UIViewController: UISplitViewControllerDelegate  {
    public func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        print(#function)
        return true
    }
}
