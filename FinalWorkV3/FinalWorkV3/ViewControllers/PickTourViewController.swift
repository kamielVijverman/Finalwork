//
//  PickTourViewController.swift
//  FinalWorkV3
//
//  Created by student on 19/05/2018.
//  Copyright © 2018 EHB. All rights reserved.
//

import UIKit

class PickTourViewController: UIViewController {

    @IBOutlet weak var lblPickTour: UILabel!
    @IBOutlet weak var lblEarlyHum: UILabel!
    @IBOutlet weak var lblEarlyLife: UILabel!
    @IBOutlet weak var btnEarlyHuman: UIButton!
    @IBOutlet weak var btnHomoHab: UIButton!
    @IBOutlet weak var btnEarlyLife: UIButton!
    @IBOutlet weak var btnTrex: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnTrexClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "showQuizTrex", sender: btnTrex)
    }
    @IBAction func btnHomoHabClicked(_ sender :Any) {
         self.performSegue(withIdentifier: "showQuizTrex", sender: btnTrex)
        
    }
    @IBAction func btnEarlyHumanClicked(_ sender :Any) {
        self.performSegue(withIdentifier: "showQuizTrex", sender: btnTrex)
        
    }
    @IBAction func btnEarlyLifeClicked(_ sender :Any) {
        self.performSegue(withIdentifier: "showQuizTrex", sender: btnTrex)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showQuizHomoHab") {
            let nextVC = (segue.destination as! TourViewController)
            nextVC.vragen=[Localization("vraag1"), Localization("vraag2"), Localization("vraag3")]
            
        }
    }

}
