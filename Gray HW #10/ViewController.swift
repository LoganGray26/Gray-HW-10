//
//  ViewController.swift
//  Gray HW #10
//
//  Created by logan gray on 5/4/20.
//  Copyright © 2020 logan gray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var pizzaPlace: UITextField!
    @IBOutlet weak var pizzaType: UITextField!
    @IBOutlet weak var sodaType: UITextField!
    @IBOutlet weak var results: UITextView?
    

    
    
    
    
    
    
    
    
    @IBAction func saveResults(_ sender: Any) {
        let csvLine:String = "\(Name.text!),\(pizzaPlace.text!),\(pizzaType.text!),\(sodaType.text!)\n"
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir:String=paths[0]
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        
        if !FileManager.default.fileExists(atPath: resultsFile) {
            FileManager.default.createFile(atPath: resultsFile,contents: nil, attributes: nil)
        }
        
        let fileHandle:FileHandle=FileHandle(forUpdatingAtPath:resultsFile)!
        fileHandle.seekToEndOfFile()
        fileHandle.write(csvLine.data(using: String.Encoding.utf8)!)
        fileHandle.closeFile()
        
        Name.text = ""
        pizzaPlace.text = ""
        pizzaType.text = ""
        sodaType.text = ""
    }
    
    
    
    
    
    @IBAction func displayResults(_ sender: Any) {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir:String=paths[0] as String
        
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        
        
        
        
        if FileManager.default.fileExists(atPath: resultsFile) {
            let fileHandle:FileHandle = FileHandle(forReadingAtPath:resultsFile)!
            let resultsData:String!=NSString(data: fileHandle.availableData, encoding: String.Encoding.utf8.rawValue)! as String
            fileHandle.closeFile()
            
            
            results?.text=resultsData
        }
        else
        {
            
        }
        
        
        
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
