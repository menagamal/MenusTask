//
//  DetailsViewController.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController ,  UIScrollViewDelegate{
    
    var presenter:DetailsPresenter!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    var lastContentOffset: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate =  self
        self.view.hero.id = "foo"
        self.hero.modalAnimationType = .selectBy(presenting:.zoom, dismissing:.zoomOut)
        self.view.hero.modifiers = [.translate(y: 500), .useGlobalCoordinateSpace]
        
        presenter.getMealDetails()
        
    }
    @IBAction func dismissVc(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y < self.lastContentOffset || scrollView.contentOffset.y <= 0) && (self.heightConstraint.constant != 400)  {
            //Scrolling up, scrolled to top
            if lastContentOffset < 100 {
                UIView.animate(withDuration: 0.0, animations: {
                    if self.heightConstraint.constant < 400 {
                        self.heightConstraint.constant += 40
                        self.heightConstraint.isActive = true
                        
                    }
                })
                
            }
            
        }
        else if (scrollView.contentOffset.y > self.lastContentOffset) && self.heightConstraint.constant != 0.0 {
            //Scrolling down
            UIView.animate(withDuration: 0.0, animations: {
                if self.heightConstraint.constant > 80 {
                    self.heightConstraint.constant -= 40
                    self.heightConstraint.isActive = true
                    
                }
            })
            
            
            
        }
        self.lastContentOffset = scrollView.contentOffset.y
    }
}


extension DetailsViewController:DetailsView {
    
    func showError(errorStr: String) {
        self.showErrorMessage(error: errorStr)
    }
    
}
