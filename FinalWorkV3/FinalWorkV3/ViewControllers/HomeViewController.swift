//
//  HomeViewController.swift
//  FinalWorkV3
//
//  Created by student on 19/05/2018.
//  Copyright © 2018 EHB. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblHomeInfo: UITextView!
    @IBOutlet weak var btnExplore: UIButton!
    @IBOutlet weak var btnRetakeTut: UIButton!
    @IBOutlet weak var btnTour: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewFromLocalisation()
        
    }
    
    func configureViewFromLocalisation() {
        lblHomeInfo.text = Localization("homeInfo")
        btnTour.setTitle(Localization("TakeTour"), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
