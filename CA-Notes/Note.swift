//
//  Note.swift
//  CA-Notes
//
//  Created by aubert andrea on 06/02/2020.
//  Copyright © 2020 CorentinAndreaCorp. All rights reserved.
//

import Foundation

class Note {
    var titre: String
    var contenu: String
    var dateNote: Date
    
    //var localisation
    
    init(titre:String, contenu:String, datestr:String ) {
        self.titre=titre;
        self.contenu=contenu;
        self.dateNote = Date();
        dateNote=convertStrToDate(datestr: datestr);
    }
    
    init(titre:String, contenu:String, date:Date ) {
        self.titre=titre;
        self.contenu=contenu;
        self.dateNote = date;
    }
    
    func convertStrToDate(datestr:String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm";
        return formatter.date(from: datestr)!;
    }
    
    func convertDateToStr() -> String {
        let formatter = DateFormatter();
        formatter.dateFormat = "dd/MM/yyyy HH:mm";
        return formatter.string(from: dateNote);
        
    }
}
