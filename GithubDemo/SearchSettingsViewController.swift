//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Sylvia Mach on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {
    
    @IBOutlet weak var starSlider: UISlider!
    
    @IBOutlet weak var minStarLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    var settings: GithubRepoSearchSettings? {
        didSet {
            //print("\(settings)")
        }
    }
    
    weak var delegate: SettingsPresentingViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        //print("Testing...\(settings)")
        starSlider.value = Float((settings?.minStars)!)
        minStarLabel.text = "\(settings?.minStars)"
        settings?.minStars = Int(starSlider.value)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveButtonTap(_ sender: Any) {
        self.delegate?.didSaveSettings(settings: self.settings!)
        print("")
        print("savebutton: \(settings?.searchString)")
        print("savebutton: \(settings?.minStars)")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        self.present(vc!, animated: true) { 
            
        }
        
        
    }
    
 
    @IBAction func cancelButtonTap(_ sender: Any) {
        self.delegate?.didCancelSettings()
    }
    
    
    @IBAction func starsliderOnChange(_ sender: UISlider) {
        settings?.minStars = Int(starSlider.value) 
       
        if let min = settings?.minStars {
            settings?.minStars = min
            minStarLabel.text = "\(min)"
        }
        
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
