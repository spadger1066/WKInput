//
//  InterfaceController.swift
//  WKTextInputWatch Extension
//
//  Created by Stephen on 16/10/2015.
//  Copyright © 2015 lumiator.technology.com. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var lblInput: WKInterfaceLabel!
    @IBOutlet var imgInput: WKInterfaceImage!
    
    var emojiImage:UIImage!
    
    @IBAction func getInput() {
        // Get text input
        let suggestions = ["one","two","three","four"]
        presentTextInputControllerWithSuggestions(suggestions, allowedInputMode: WKTextInputMode.AllowEmoji, completion: { (results) -> Void in
            // Results may be nil
            if let resultArray = results {
                // Got a result
                if (resultArray[0] is String) {
                    self.lblInput.setText(resultArray[0] as? String)
                } else {
                    // It's an emoji
                    let emojiImage = UIImage(data: resultArray[0] as! NSData)
                    self.imgInput.setImage(emojiImage)
                }
            } else {
                // No results returned
                self.lblInput.setText("Cancelled")
            }
        })
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
