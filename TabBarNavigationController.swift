//
//  TabBarNavigationController.swift
//  mobime
//
//  Created by João Pedro Silva on 05/03/2019.
//  Copyright © 2019 CEIIA. All rights reserved.
//

import UIKit

///Hides NavigationBar For the firstViewController, hide tabBarController for next viewController
class TabBarNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
   
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if viewController == self.viewControllers.first {
            
            self.setNavigationBarHidden(true, animated: animated)
        } else {
            
            self.setNavigationBarHidden(false, animated: animated)
        }
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if toVC != self.viewControllers.first {
            
            toVC.hidesBottomBarWhenPushed = true
        }
        return nil
    }
}
