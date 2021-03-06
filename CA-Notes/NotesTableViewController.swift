//
//  NotesTableViewController.swift
//  CA-Notes
//
//  Created by aubert andrea on 06/02/2020.
//  Copyright © 2020 CorentinAndreaCorp. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    var notes: [Note] = [
        Note(titre: "On", contenu: "AHAHA", datestr: "11/11/2000 08:46"),
        Note(titre: "Est", contenu: "OHOHOH", datestr: "24/11/2000 12:13"),
        Note(titre: "Dans", contenu: "IHIHIH", datestr: "01/01/2015 07:31"),
        Note(titre: "La", contenu: "EHEHEHE", datestr: "02/03/1999 21:00"),
        Note(titre: "Panade", contenu: "UHUHUH", datestr: "31/12/2020 00:00")
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.titre;
        cell.detailTextLabel?.text = note.convertDateToStr();
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let moveNote = notes.remove(at: fromIndexPath.row)
        notes.insert(moveNote, at: to.row)
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    @IBAction func UnwindToNote(segue: UIStoryboardSegue) {
        if segue.identifier == "SaveUnwind" {
            let sourceViewController = segue.source as! AddEditNoteTableViewController
            if let note = sourceViewController.note {
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    notes[selectedIndexPath.row] = note
                    tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
                } else {
                    let newIndexPath = IndexPath(row: notes.count, section: 0)
                    notes.append(note)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editNote" {
            let indexPath = tableView.indexPathForSelectedRow!
            let note = notes[indexPath.row]
            
            let navigationController = segue.destination as! UINavigationController
            let addEditController = navigationController.topViewController as! AddEditNoteTableViewController
            
            addEditController.note = note
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
