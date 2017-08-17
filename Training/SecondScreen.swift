//
//  SecondScreen.swift
//  Training
//
//  Created by alex on 8/14/17.
//  Copyright © 2017 alex. All rights reserved.
//

import Foundation
import UIKit

import Firebase

class SecondScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //defining firebase reference var
    var refArtists: DatabaseReference!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldGenre: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBOutlet weak var recibir: UILabel!
     var Labelstext = String()
    
  
    @IBOutlet weak var table: UITableView!
    
    //list to store all the artist
    var artistList = [Modelo]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return artistList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //creating a cell using the custom class
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TablaView2
        
        //the artist object
        let artist: Modelo
        
        //getting the artist of selected position
        artist = artistList[indexPath.row]
        
        //adding values to labels
        cell.titulo1.text = artist.name
        cell.titulo2.text = artist.genre
        
        //returning cell
        return cell
    }
    
    @IBAction func buttonAddArtist(_ sender: UIButton) {
        addArtist()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recibir.text = "Bienvenido "+Labelstext
        
        refArtists = Database.database().reference().child("artists");
        
        //observing the data changes
        refArtists.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.artistList.removeAll()
                
                //iterating through all the values
                for artists in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let artistObject = artists.value as? [String: AnyObject]
                    let artistName  = artistObject?["artistName"]
                    let artistId  = artistObject?["id"]
                    let artistGenre = artistObject?["artistGenre"]
                    
                    //creating artist object with model and fetched values
                    let artist = Modelo(id: artistId as! String?, name: artistName as! String?, genre: artistGenre as! String?)
                    
                    //appending it to list
                    self.artistList.append(artist)
                }
                
                //reloading the tableview
                self.table.reloadData()
            }
        })
        
    }
    
    //this function will be called when a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //getting the selected artist
        let artist  = artistList[indexPath.row]
        
        //building an alert
        let alertController = UIAlertController(title: artist.name, message: "Give new values to update ", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting artist id
            let id = artist.id
            
            //getting new values
            let name = alertController.textFields?[0].text
            let genre = alertController.textFields?[1].text
            
            //calling the update method to update artist
            self.updateArtist(id: id!, name: name!, genre: genre!)
        }
        
        //the cancel action deleting the artist
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            //deleting artist
            self.deleteArtist(id: artist.id!)
        }
        
        //adding two textfields to alert
        alertController.addTextField { (textField) in
            textField.text = artist.name
        }
        alertController.addTextField { (textField) in
            textField.text = artist.genre
        }
        
        //adding action
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //presenting dialog
        present(alertController, animated: true, completion: nil)
    }
    
    
    func deleteArtist(id:String){
        refArtists.child(id).setValue(nil)
        
        //displaying message
        labelMessage.text = "Artist Deleted"
    }
    
    func updateArtist(id:String, name:String, genre:String){
        //creating artist with the new given values
        let artist = ["id":id,
                      "artistName": name,
                      "artistGenre": genre
        ]
        
        //updating the artist using the key of the artist
        refArtists.child(id).setValue(artist)
        
        //displaying message
        labelMessage.text = "Artist Updated"
    }
    
    func addArtist(){
        //generating a new key inside artists node
        //and also getting the generated key
        let key = refArtists.childByAutoId().key
        
        //creating artist with the given values
        let artist = ["id":key,
                      "artistName": textFieldName.text! as String,
                      "artistGenre": textFieldGenre.text! as String
        ]
        
        //adding the artist inside the generated unique key
        refArtists.child(key).setValue(artist)
        
        //displaying message
        labelMessage.text = "Artist Added"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

