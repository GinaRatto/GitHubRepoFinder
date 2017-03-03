//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Gina Ratto on 3/1/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}

class SearchSettingsViewController: UIViewController {
    
    @IBOutlet weak var sliderVal: UILabel!
    @IBOutlet weak var slider: UISlider!

    weak var delegate: SettingsPresentingViewControllerDelegate?
    var settings: GithubRepoSearchSettings?
    var searchString: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if settings != nil {
            slider.value = Float((settings?.minStars)!)
        }
        
        var value = slider.value
        value.round(FloatingPointRoundingRule.down)
        sliderVal.text = "\(value)"
    }
    
    @IBAction func sliderValChanged(_ sender: Any) {
        var value = slider.value
        value = value.rounded()
        sliderVal.text = "\(value)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        let settings: GithubRepoSearchSettings = GithubRepoSearchSettings(minStars: Int(slider.value), search: searchString)
        delegate!.didSaveSettings(settings: settings)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
