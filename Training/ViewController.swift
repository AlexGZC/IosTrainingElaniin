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
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loginTapped(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: self.Email.text!, password: self.Password.text!){(error,user)in
            if error != nil{
            self.performSegue(withIdentifier: "user", sender:self)
        }else{
                
                    let alertController1 = UIAlertController(title: "Error", message:"Debe ingresar un EMAIL", preferredStyle: UIAlertControllerStyle.alert)
                    alertController1.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
                    self.present(alertController1, animated: true, completion: nil)
                
        }
        }
        
        
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
}
    

   


