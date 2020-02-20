//
//  AddEditNoteTableViewController.swift
//  CA-Notes
//
//  Created by holcvart corentin on 12/02/2020.
//  Copyright © 2020 CorentinAndreaCorp. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AddEditNoteTableViewController: UITableViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var note: Note?
    @IBOutlet weak var titreTextField: UITextField!
    @IBOutlet weak var contenuTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // map
    // https://medium.com/@luc.derosne/démarrez-la-géolocalisation-dans-swift-en-10-points-avec-mapkit-5442c421b16d
    @IBOutlet weak var mapView: MKMapView!
    // San José Capitale du Costa Rica
    var latitudeInit: Double = 9.998784
    var longitudeInit: Double = -84.204007
    var coordinateInit :  CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: latitudeInit, longitude: longitudeInit)
    }
    
    var userPosition :  CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitudeInit, longitude: longitudeInit)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let note = note {
            titreTextField.text = note.titre
            contenuTextField.text = note.contenu
        }
        updateSaveButtonState()
        
        // map
        super.viewDidLoad()
        let span = MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3)
        let region = MKCoordinateRegion(center: coordinateInit, span: span)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
    }
    
    func updateSaveButtonState() {
        let titre = titreTextField.text ?? ""
        let contenu  = contenuTextField.text ?? ""
        
        saveButton.isEnabled = !titre.isEmpty && !contenu.isEmpty
    }
    
    @IBAction func editChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    

    // MARK: - Table view data source

//    //override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveUnwind" {
            let titre = titreTextField.text ?? ""
            let contenu  = contenuTextField.text ?? ""
            
            note = Note(titre: titre, contenu: contenu, date: Date());
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    // map
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
             if let maPosition = locations.last {
              //userPosition = maPosition
             }
         }
    }
  
}


