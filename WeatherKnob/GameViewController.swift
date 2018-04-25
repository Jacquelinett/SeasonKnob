//
//  GameViewController.swift
//  WeatherKnob
//
//  Created by Jacqueline on 12/30/17.
//  Copyright © 2017 Jacqueline. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var lblWeather: UILabel!
    
    @IBOutlet weak var lblIfSpring: UILabel!
    @IBOutlet weak var lblIfSummer: UILabel!
    @IBOutlet weak var lblIfFall: UILabel!
    @IBOutlet weak var lblIfWinter: UILabel!
    
    @IBOutlet weak var lblDoSpring: UILabel!
    @IBOutlet weak var lblDoSummer: UILabel!
    @IBOutlet weak var lblDoFall: UILabel!
    @IBOutlet weak var lblDoWinter: UILabel!
    
    var currentGame: GameScene!
    var knob : Knob!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentGame = GameScene(fileNamed: "GameScene")
        currentGame.viewController = self
        
        currentGame.scaleMode = .aspectFill
        
        print(currentGame);
        
        if let view = self.view as! SKView? {
            view.presentScene(currentGame)
            
            view.ignoresSiblingOrder = false
            
            view.showsFPS = false
            view.showsNodeCount = false
            
        }
        
        knob = Knob(frame: CGRect(x: self.view.center.x + 165, y: self.view.center.y + 160, width: 150, height: 150))
        knob.backgroundColor = UIColor(red:0.24, green:0.24, blue:0.36, alpha:0.7)
        self.view.addSubview(knob)
        knob.addTarget(self, action:#selector(knobRotated), for: .valueChanged)
    }
    
    func resetLabels() {
        lblIfSpring.textColor = UIColor.white
        lblDoSpring.textColor = UIColor.white
        
        lblIfSummer.textColor = UIColor.white
        lblDoSummer.textColor = UIColor.white
        
        lblIfFall.textColor = UIColor.white
        lblDoFall.textColor = UIColor.white
        
        lblIfWinter.textColor = UIColor.white
        lblDoWinter.textColor = UIColor.white
    }
    
    @objc func knobRotated() {
        resetLabels()
        //print("value: \(knob.value)")
        if (knob.value >= 0 && knob.value < Double.pi / 2) {
            lblWeather.text = "Spring";
            currentGame.springBackground.isHidden = false;
            currentGame.summerBackground.isHidden = true;
            currentGame.fallBackground.isHidden = true;
            currentGame.winterBackground.isHidden = true;
            
            lblIfSpring.textColor = UIColor.yellow
            lblDoSpring.textColor = UIColor.yellow
        }
        else if (knob.value >= Double.pi / 2 && knob.value < Double.pi) {
            lblWeather.text = "Summer";
            currentGame.springBackground.isHidden = true;
            currentGame.summerBackground.isHidden = false;
            currentGame.fallBackground.isHidden = true;
            currentGame.winterBackground.isHidden = true;
            
            lblIfSummer.textColor = UIColor.yellow
            lblDoSummer.textColor = UIColor.yellow
        }
        else if (knob.value >= Double.pi && knob.value < 3 * Double.pi / 2) {
           lblWeather.text = "Autumn";
            currentGame.springBackground.isHidden = true;
            currentGame.summerBackground.isHidden = true;
            currentGame.fallBackground.isHidden = false;
            currentGame.winterBackground.isHidden = true;
            
            lblIfFall.textColor = UIColor.yellow
            lblDoFall.textColor = UIColor.yellow
        }
        else if (knob.value >= 3 * Double.pi / 2 && knob.value < 2 * Double.pi) {
            lblWeather.text = "Winter";
            currentGame.springBackground.isHidden = true;
            currentGame.summerBackground.isHidden = true;
            currentGame.fallBackground.isHidden = true;
            currentGame.winterBackground.isHidden = false;
            
            lblIfWinter.textColor = UIColor.yellow
            lblDoWinter.textColor = UIColor.yellow
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
