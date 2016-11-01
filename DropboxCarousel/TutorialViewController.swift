//
//  TutorialViewController.swift
//  DropboxCarousel
//
//  Created by Amy Wu on 10/24/16.
//  Copyright © 2016 Amy Wu. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.frame.size.width = 375
        scrollView.contentSize.width = 1500

    }
    
        
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        
    }



        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
