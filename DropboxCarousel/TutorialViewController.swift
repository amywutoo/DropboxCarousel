//
//  TutorialViewController.swift
//  DropboxCarousel
//
//  Created by Amy Wu on 10/24/16.
//  Copyright © 2016 Amy Wu. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var imageView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 1500, height: 667)
        scrollView.delegate = self
        
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator  = false
        
        
        }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView!) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)

        }


        // Do any additional setup after loading the view.
    }

        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


