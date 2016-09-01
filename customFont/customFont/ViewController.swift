//
//  ViewController.swift
//  customFont
//
//  Created by Chris Chen on 9/1/16.
//  Copyright © 2016 ChrisDoCoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITextViewDelegate,
    UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet var myTableView: UITableView!
    
    var input = "Hello guys,\n\nI am Chris, this is my third Swift project, customFont.\nHope you enjoy it.\n\nCheers,\nChris\n\nReference:\n     https://github.com/allenwong\nFont Source:\n     https://www.template.net/design-templates/fonts/ios-font/"
    var fontList = []
    var selectedFont = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSBundle.mainBundle().pathForResource("fontList", ofType:"plist")
        
        fontList = NSMutableArray(contentsOfFile: path!)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - UIPickerView Delegates and data sources
    //MARK: Data Sources
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 350
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCellWithIdentifier("fontCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = input
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: selectedFont, size: 20)
        
        return cell
        
    }
    
    
    
    //MARK: - UIPickerView Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontList.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontList[row] as? String
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedFont = fontList[row] as! String
    }
    
    
    @IBAction func fontSelectDone(sender: AnyObject) {
        myTableView.reloadData()
    }

}

