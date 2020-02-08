//
//  ViewController.swift
//  UIViewController
//
//  Created by Polina on 06.02.2020.
//  Copyright © 2020 SergeevaPolina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let pushButton: UIButton = {
        let pushButton = UIButton(type: .system)
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.setTitle("Push", for: .normal)
        pushButton.sizeToFit()
        pushButton.addTarget(self, action: #selector(switchSecondViewController(parametrSender:)), for: .touchUpInside)
        return pushButton
    }()
    
    let dateLaunchTimeLabel: UILabel = {
        let dateLaunchTimeLabel  = UILabel(frame: CGRect(x: 16, y: 93, width: 200, height: 17))
        dateLaunchTimeLabel .backgroundColor = UIColor.white
        dateLaunchTimeLabel .font = .systemFont(ofSize: 17)
        dateLaunchTimeLabel .numberOfLines = 1
        dateLaunchTimeLabel .textColor = UIColor.black
        return dateLaunchTimeLabel
    }()
    
    let dateAppTimeLabel: UILabel = {
        let dateAppTimeLabel = UILabel(frame: CGRect(x: 16, y: 175, width: 200, height: 17))
        dateAppTimeLabel.backgroundColor = UIColor.white
        dateAppTimeLabel.font = .systemFont(ofSize: 17)
        dateAppTimeLabel.numberOfLines = 1
        dateAppTimeLabel.textColor = UIColor.black
        return dateAppTimeLabel
    }()
    
    let launchTimeLabel: UILabel = {
        let launchTimeLabel  = UILabel(frame: CGRect(x: 16, y: 60, width: 200, height: 17))
        launchTimeLabel.backgroundColor = UIColor.white
        launchTimeLabel.text = "Launch Time"
        launchTimeLabel.font = .systemFont(ofSize: 17)
        launchTimeLabel.numberOfLines = 1
        launchTimeLabel.textColor = UIColor.black
        return launchTimeLabel
    }()
    
    var appTimeLabel: UILabel = {
        let appTimeLabel = UILabel(frame: CGRect(x: 16, y: 142, width: 200, height: 17))
        appTimeLabel.backgroundColor = UIColor.white
        appTimeLabel.text = "Appearance Time"
        appTimeLabel.font = .systemFont(ofSize: 17)
        appTimeLabel.numberOfLines = 1
        appTimeLabel.textColor = UIColor.black
        return appTimeLabel
    }()
    
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(dateLaunchTimeLabel)
        self.view.addSubview(launchTimeLabel)
        self.view.addSubview(appTimeLabel)
        self.view.addSubview(dateAppTimeLabel)
        self.view.addSubview(pushButton)
        
        pushButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pushButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pushButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pushButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -32).isActive = true
        
        self.title = "Simple app"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .plain, target: self, action: #selector(showUpdateDate(parametrSender:)))
        
        showCurrentDate()
        
    }
    
    override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showUpdateDate(parametrSender:dateAppTimeLabel)
    }
    
    
    @objc func switchSecondViewController(parametrSender: Any) {
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated:  false)
        
    }
    
    @objc func showUpdateDate(parametrSender: Any){
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy hh:mm a"
        let dateString = dateFormatter.string(from: date as Date)
        dateAppTimeLabel.text = "\(dateString)"
    }
    
    func showCurrentDate() {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy hh:mm a"
        let dateString = dateFormatter.string(from: date as Date)
        dateLaunchTimeLabel.text = "\(dateString)"
        dateAppTimeLabel.text = "\(dateString)"
        
    }
}
