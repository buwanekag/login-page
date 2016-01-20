//
//  ViewController.swift
//  login page
//
//  Created by Buwaneka Galpoththawela on 1/10/16.
//  Copyright © 2016 Buwaneka Galpoththawela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var baseUrlString = "medlink-staging.herokuapp.com"
    
    
    //MARK - INTERACTIVE METHOD
    @IBAction func signinTapped(sender: UIButton){
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        if (username!.isEmpty || password!.isEmpty){
            
            let alertView = UIAlertController(title: "sign in failed", message: "please enter username and password", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "ok", style: .Default, handler: nil))
            
        } else {
            
            
            
            let url = NSURL(string: "https://\(baseUrlString)/api/v1/auth")
            
            let request = NSMutableURLRequest(URL: url!,cachePolicy: .ReloadIgnoringLocalCacheData, timeoutInterval: 30.0)
            
            //var ids = ""
            //let newItems = supplyIds.map({ item in "supply_ids[]=\(item)"})
           // ids = newItems.joinWithSeparator("&")
            
            
            request.HTTPMethod = "POST"
            
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
           request.HTTPBody = "email=\(username)&password= \(password)".dataUsingEncoding(NSUTF8StringEncoding)
            
            
            
            
           // request.signWithAccessIdentifier("2376", andSecret: "HLHSDDp+95IqeCuAjCslZRqRcPdnRXFd55W904lamDMQh9pa+UIrNRz+hiPpg5u7FKKPF5GjQPEPSWYbzbGbpw==")
            
            let urlSession = NSURLSession.sharedSession()
            
            let task = urlSession.dataTaskWithRequest(request) { (data, response, error) -> Void in
                
                if error != nil {
                    dispatch_async(dispatch_get_main_queue()){
                        let alert = UIAlertController (title: "Not Submited", message: "Request  not sent send text message", preferredStyle: .Alert)
                        
                        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil ))
                        //alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: sen))
                        
                        
                        self.presentViewController(alert, animated: true, completion: nil)
                        
                        print("error=\(error)")
                        let responseIn = response
                        print("\(responseIn)")
                        
                    
                    }
                
                    
                    return

                }
            
    
    }
            task.resume()
        }
    }
    
    
    
    
    
    //MARK: - LIFE CYCLE METHOD

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
      //  self.performSegueWithIdentifier("", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

