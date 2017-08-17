//
//  ViewController.swift
//  Training
//
//  Created by alex on 8/14/17.
//  Copyright © 2017 alex. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    

    @IBOutlet weak var Login: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
              
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Logear(sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewControllerB = segue.destination as? SecondScreen {
            if(Email.text==""){
                let alertController1 = UIAlertController(title: "Error", message:"Debe ingresar un EMAIL", preferredStyle: UIAlertControllerStyle.alert)
                alertController1.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController1, animated: true, completion: nil)
            }else if(Password.text == ""){
                let alertController2 = UIAlertController(title: "Error", message:"Debe ingresar Password", preferredStyle: UIAlertControllerStyle.alert)
                alertController2.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController2, animated: true, completion: nil)    }
                
            else{
               
                      viewControllerB.Labelstext = self.Email.text!
                
            }

            
        }
        
        
        
    }
    
    
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "To Do App", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func signIn() {
        performSegue(withIdentifier: "user", sender: nil)
    }
    
}
