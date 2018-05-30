//
//  TourViewController.swift
//  FinalWorkV3
//
//  Created by student on 19/05/2018.
//  Copyright © 2018 EHB. All rights reserved.
//

import UIKit

class TourViewController: UIViewController {
    @IBOutlet weak var lblVraag: UILabel!
    @IBOutlet weak var lblPunten: UILabel!
    @IBOutlet weak var lblVraagNr: UILabel!
    
    @IBOutlet weak var btnVraag1: UIButton!
    @IBOutlet weak var btnVraag2: UIButton!
    @IBOutlet weak var btnVraag3: UIButton!
    @IBOutlet weak var btnVraag4: UIButton!
    //variabelen
    var vragen = [Localization("vraag1"), Localization("vraag2"), Localization("vraag3")]
    var antwoorden = [[Localization("vraag1optie1"), Localization("vraag1optie2"), Localization("vraag1optie3"), Localization("vraag1optie4")], [Localization("vraag2optie1"), Localization("vraag2optie2"), Localization("vraag2optie3"), Localization("vraag2optie4")], [Localization("vraag3optie1"), Localization("vraag3optie2"), Localization("vraag3optie3"), Localization("vraag3optie4")]]
    var currVraag = 0
    var juisteVraag:UInt32 = 0
    var points = 0;
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nieuweVraag()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action(_ sender: AnyObject)
    {
        
        if (sender.tag == Int(juisteVraag))
        {
            sender.setTitleColor(UIColor.green, for: .normal)
            points += 1
        }
        else
        {
            sender.setTitleColor(UIColor.red, for: .normal)
        }
        
        if (currVraag != vragen.count)
        {
            let when = DispatchTime.now() + 1
            DispatchQueue.main.asyncAfter(deadline: when) {
                sender.setTitleColor(UIColor.init(red:0.23, green:0.76, blue:0.96, alpha:1.0), for: .normal)
                self.nieuweVraag()
            }
        }
        else
        {
            performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    //nieuwe vraag
    func nieuweVraag() {
        lblPunten.text = "\(points)"
        lblVraag.text = vragen[currVraag]
        lblVraagNr.text = "\(currVraag + 1)"
        
        //https://swift3tutorials.com/swift-3-while-statements-2/
        juisteVraag = arc4random_uniform(4)+1
        
        //Create a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...4
        {
            //Create a button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(juisteVraag))
            {
                button.setTitle(antwoorden[currVraag][0], for: .normal)
            }
            else
            {
                button.setTitle(antwoorden[currVraag][x], for: .normal)
                x += 1
            }
        }
        currVraag += 1
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
