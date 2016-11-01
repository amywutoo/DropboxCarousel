//
//  LogInViewController.swift
//  DropboxCarousel
//
//  Created by Amy Wu on 10/22/16.
//  Copyright © 2016 Amy Wu. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParent: UIView!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var UIScrollView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    @IBAction func tappedOut(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func didPressSignIn(_ sender: AnyObject) {
        
        self.loginIndicator.startAnimating()
        
        if (email.text == "" || password.text == "") {
            self.loginIndicator.stopAnimating()
            // These are empty fields
            let emptyAlertContoller = UIAlertController(
                title: "Missing fields",
                message: "Enter email address and password.",
                preferredStyle: .alert
            )
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            emptyAlertContoller.addAction(OKAction)
            
            present(emptyAlertContoller, animated: true) {
                // something here?
            }
            
        } else if email.text == "amy@mileiq.com" && password.text == "password" {
            
            let altercontroller = UIAlertController(
                title: "Signing in...",
                message: "",
                preferredStyle: .alert
            )
            
            self.present(altercontroller, animated:true, completion:nil)
            
            
            //Success!
            delay(2, closure: {
                self.loginButton.isSelected = false
                self.loginIndicator.stopAnimating()
                
                altercontroller.dismiss(animated: true, completion: nil)
                
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let tutorialVC = mainStoryboard.instantiateViewController(withIdentifier: "tutorialVC") as! TutorialViewController
                self.present(tutorialVC, animated: true, completion: nil)
                
            })
        
        } else {
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                let alertController = UIAlertController(
                    title: "Invalid email/password",
                    message: "Please try again",
                    preferredStyle: .alert
                )
    
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
    
                }
                alertController.addAction(cancelAction)
    
                self.present(alertController, animated: true) {
                }
            })
    
    }
    
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonInitialY = buttonParent.frame.origin.y
        buttonOffset = -75
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) {
            (notification: Notification) in
            
            // Move the button up above keyboard
            self.buttonParent.frame.origin.y = self.buttonInitialY + self.buttonOffset
            // Scroll the scrollview up
            self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            // Any code you put in here will be called when the keyboard is about to hide
        }
        
        scrollView.contentSize = UIScrollView.frame.size
        scrollView.contentInset.bottom = 175
        
            func scrollViewDidScroll(_ scrollView: UIScrollView) {
                // This method is called as the user scrolls
            }
            
            func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
                
            }
            
            func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
                // This method is called right as the user lifts their finger
            }
            
            func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
                // This method is called when the scrollview finally stops scrolling.
            
            }
        
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return fieldParentView
            
        // Do any additional setup after loading the view.
            }
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            }

    
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
