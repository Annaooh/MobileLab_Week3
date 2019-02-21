//
//  SecondViewController.swift
//  WalkingTree
//
//  Created by Anna Oh on 19/2/2019.
//  Copyright © 2019 Anna Oh. All rights reserved.
//

import UIKit
import CoreMotion

class SecondViewController: UIViewController {
var pedometer = CMPedometer()
      var leaves = [UIView]()
    ///This part is for link to tree??

    var treeName: String?
    
    //let imageNames = ["leaf1", "leaf2", "leaf3", "leaf4", "fruit"]
    
    var treeDataArray = [Tree]()

    var didSaveTree: ((_ treeDataArray: [Tree]) -> ())?

    
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var Branch: UIImageView!
    
    @IBAction func StartButton(_ sender: UIButton) {
    //StatusLabel.text = "STOP"
//        let tree = Tree
        //This part link to tree?
//    didSaveTree?(tree)
     treestart()
    }
    
    /////This is the function for making random leaves
    func makeRandomLeaf1() {
        // Location --> CGPoint()
        // Size --> CGSize()
        // Color --> UIColor()
        // Opacity --> CGFloat
        let screenCenter = self.view.center
        let myCenter = CGPoint(x: screenCenter.x, y: screenCenter.y - 100.0)
        
        let xOffset = CGFloat.random(in: -120.0...100.0)
        let yOffset = CGFloat.random(in: -120.0...100.0)
        
        let center = CGPoint(x: myCenter.x + xOffset, y: myCenter.y + yOffset)
        
        let randomRadius = CGFloat.random(in: 50.0...180.0)
        
        let size = CGSize(width: randomRadius, height: randomRadius)
        let newLeafView1 = UIView(frame: CGRect(origin: CGPoint(), size: size))
        newLeafView1.center = center
        
        // Round the view
        newLeafView1.layer.cornerRadius = randomRadius / 2.0
        newLeafView1.clipsToBounds = true
        
        // Set color
//        let redValue = CGFloat(drand48())
//        let greenValue = CGFloat(drand48())
//        let blueValue = CGFloat(drand48())
        let alpharandom = CGFloat.random(in: 0.4...0.8)
        let color1 = UIColor(red: 51.0 / 255.0, green: 207.0 / 255.0, blue: 80.0 / 255.0, alpha: alpharandom)
     /////Q var particleColorVariation() = {0.25, 1.0, 1.0, 1.0}

        newLeafView1.backgroundColor = color1
        
        self.view.addSubview(newLeafView1)
        
        self.leaves.append(newLeafView1)
        
      
    }
    func makeRandomLeaf2() {
        let screenCenter = self.view.center
        let myCenter = CGPoint(x: screenCenter.x, y: screenCenter.y - 100.0)
        
        let xOffset = CGFloat.random(in: -100.0...90.0)
        let yOffset = CGFloat.random(in: -130.0...90.0)
        
        let center = CGPoint(x: myCenter.x + xOffset, y: myCenter.y + yOffset)
        
        let randomRadius = CGFloat.random(in: 30...120.0)
        
        let size = CGSize(width: randomRadius, height: randomRadius)
        let newLeafView2 = UIView(frame: CGRect(origin: CGPoint(), size: size))
        newLeafView2.center = center
        
        // Round the view
        newLeafView2.layer.cornerRadius = randomRadius / 2.0
        newLeafView2.clipsToBounds = true
        
       ////Set Color2
        let alpharandom = CGFloat.random(in: 0.4...0.8)
        let color2 = UIColor(red: 194.0 / 255.0, green: 201.0 / 255.0, blue: 71.0 / 255.0, alpha: alpharandom)
        //        var particleColorVariation() = {0.25, 1.0, 1.0, 1.0}
        
        newLeafView2.backgroundColor = color2
        self.view.addSubview(newLeafView2)
        self.leaves.append(newLeafView2)
        }
    
    func makeRandomLeaf3() {
        let screenCenter = self.view.center
        let myCenter = CGPoint(x: screenCenter.x, y: screenCenter.y - 100.0)
        
        let xOffset = CGFloat.random(in: -100.0...90.0)
        let yOffset = CGFloat.random(in: -120.0...90.0)
        
        let center = CGPoint(x: myCenter.x + xOffset, y: myCenter.y + yOffset)
        
        let randomRadius = CGFloat.random(in: 30...100.0)
        
        let size = CGSize(width: randomRadius, height: randomRadius)
        let newLeafView3 = UIView(frame: CGRect(origin: CGPoint(), size: size))
        newLeafView3.center = center
        
        // Round the view
        newLeafView3.layer.cornerRadius = randomRadius / 2.0
        newLeafView3.clipsToBounds = true
        
        ////Set Color2
        let alpharandom = CGFloat.random(in: 0.4...0.8)
        let color3 = UIColor(red: 52.0 / 255.0, green: 130.0 / 255.0, blue: 72.0 / 255.0, alpha: alpharandom)
        //        var particleColorVariation() = {0.25, 1.0, 1.0, 1.0}
        
        newLeafView3.backgroundColor = color3
        self.view.addSubview(newLeafView3)
        self.leaves.append(newLeafView3)
    }
    func fruit() {
        let screenCenter = self.view.center
        let myCenter = CGPoint(x: screenCenter.x, y: screenCenter.y - 100.0)
        
        let xOffset = CGFloat.random(in: -100.0...90.0)
        let yOffset = CGFloat.random(in: -100.0...90.0)
        
        let center = CGPoint(x: myCenter.x + xOffset, y: myCenter.y + yOffset)
        
        let randomRadius = CGFloat.random(in: 15.0...25.0)
        
        let size = CGSize(width: randomRadius, height: randomRadius)
        let newfruitview = UIView(frame: CGRect(origin: CGPoint(), size: size))
        newfruitview .center = center
        
        // Round the view
        newfruitview .layer.cornerRadius = randomRadius / 2.0
        newfruitview .clipsToBounds = true
        
    
        let color3 = UIColor(red: 255 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 1.0)
        
        newfruitview .backgroundColor = color3
        self.view.addSubview(newfruitview )
        self.leaves.append(newfruitview )
    }
    
    /////This is function for stating the tree growing
    func treestart(){
        
        guard CMPedometer.isStepCountingAvailable() else{
            print ("Step counting is NOT available")
            return
        }
        pedometer.startUpdates(from: Date()) { (data, error) in
            if let error = error {
                print ("Error getting data:", error.localizedDescription)
            }
            if let data = data {
                print(">>> steps:", data.numberOfSteps)
                
                let currentTimeDate = Date()

                print(">>> date:", currentTimeDate.description)

                let newTreeData = Tree(date: currentTimeDate.description,
                                       stepCount: Int(truncating: data.numberOfSteps))
                
                self.treeDataArray.append(newTreeData)


                DispatchQueue.main.async{
                    self.makeRandomLeaf1()
                    self.makeRandomLeaf2()
                    self.makeRandomLeaf3()
                    self.fruit()

                }
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapBack(_ sender: UIButton) {
        didSaveTree?(treeDataArray)

        dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
