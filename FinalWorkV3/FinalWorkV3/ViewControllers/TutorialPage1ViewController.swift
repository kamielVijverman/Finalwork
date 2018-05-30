//
//  TutorialPage1ViewController.swift
//  FinalWorkV3
//
//  Created by student on 19/05/2018.
//  Copyright © 2018 EHB. All rights reserved.
//
// bron: https://github.com/micazeve/iOS-CustomLocalisator

import UIKit

class TutorialPage1ViewController: UIViewController {
    //outlets
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblMuseum: UILabel!
    @IBOutlet weak var lblTut1Info: UITextView!
    @IBOutlet weak var btnSkip: UIButton!
    
    //vars
    var coreData: [CoreData] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let arrayLanguages = Localisator.sharedInstance.getArrayAvailableLanguages()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            coreData = try context.fetch(CoreData.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
         NotificationCenter.default.addObserver(self, selector: #selector(self.receiveLanguageChangedNotification(notification:)), name: kNotificationLanguageChanged, object: nil)
        configureViewFromLocalisation()
        
    }
    
    func configureViewFromLocalisation() {
        lblWelcome.text = Localization("Welcome")
        lblMuseum.text = Localization("ToMuseum")
        lblTut1Info.text = Localization("tut1Intro")
        btnSkip.setTitle(Localization("Skip"), for: .normal)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func receiveLanguageChangedNotification(notification:NSNotification) {
        if notification.name == kNotificationLanguageChanged {
            configureViewFromLocalisation()
        }
    }
    
    // MARK: - Memory management
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: kNotificationLanguageChanged, object: nil)
    }
    @IBAction func btnSkipClick(_ sender: Any) {
        
    }
    
    @IBAction func btnNLClicked(_ sender: Any) {
        
        if SetLanguage("Dutch_nl") {
            if(coreData.count == 0) {
                let tempCoreData = CoreData(context: self.context)
                tempCoreData.taal = "nl"
                self.context.insert(tempCoreData)
                do {
                    try self.context.save()
                }
                catch {
                    print("error met core data")
                }
            }
            else {
                let tempTaal = "nl"
                coreData[0].taal = tempTaal
                do {
                    try self.context.save()
                }
                catch {
                    print("error met core data")
                }
            }
            let alert = UIAlertController(title: Localization("languageChangedWarningMessage"), message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
                
            })
            alert.addAction(UIAlertAction(title: Localization("Cancel"), style: .cancel) { action in
                print("Cancel")
            })
            self.present(alert, animated: true)
        }
    }
    @IBAction func btnENClicked(_ sender: Any) {
        if SetLanguage("English_en") {
            if(coreData.count == 0) {
                let tempCoreData = CoreData(context: self.context)
                tempCoreData.taal = "en"
                self.context.insert(tempCoreData)
                do {
                    try self.context.save()
                }
                catch {
                    print("error met core data")
                }
            }
            else {
                let tempTaal = "en"
                coreData[0].taal = tempTaal
                do {
                    try self.context.save()
                }
                catch {
                    print("error met core data")
                }
            }
            let alert = UIAlertController(title: Localization("languageChangedWarningMessage"), message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
                
            })
            alert.addAction(UIAlertAction(title: Localization("Cancel"), style: .cancel) { action in
                print("Cancel")
            })
            self.present(alert, animated: true)
        }    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
