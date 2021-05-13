//
//  ViewController.swift
//  MultipleScheme
//
//  Created by Magic-IOS on 11/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //GET SERVER URL BASED ON  "UDS"
        var nsDic : NSDictionary?
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            nsDic = NSDictionary(contentsOfFile: path)
            print(nsDic!["SERVER_URL"] as? String ?? "default")
        }
        
        
        //GET APPLICATION_NAME BASED ON "XCCONFIG" file But variable must set in infoDictionary
        print("Application Name is \(self.getApplicationName())")
        print("Controller Name is \(self.getControllerName())")
        
        
        
        //GET ENVIRONMENT BASED ON "ACTIVE COMPILATION CONDITION"
        print("The environment is \(getEnvironmentFromActiveCompilationCondition())")
    }


}

extension ViewController {
    
    func getApplicationName() -> String {
        return Bundle.main.infoDictionary?["APPLICATION_NAME"] as? String ?? "default"
    }
    
    
    func getControllerName() -> String {
        return Bundle.main.infoDictionary?["cntName"] as? String ?? "default"
    }
    
    //getEnvironmentFromActiveCompilationCondition
    func getEnvironmentFromActiveCompilationCondition() -> String {
        #if DEBUG
        return "Dev"
        #elseif QA
        return "QA"
        #elseif RELEASE
        return "Release"
        #else
        return "Unknow environment"
        #endif
    }
}


 

