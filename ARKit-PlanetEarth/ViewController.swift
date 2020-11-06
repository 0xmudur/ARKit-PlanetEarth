//
//  ViewController.swift
//  ARKit-PlanetEarth
//
//  Created by Muhammed Emin Aydın on 8.10.2020.


import UIKit
import ARKit
class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }

    override func viewDidAppear(_ animated: Bool) {
        let earth = SCNNode()
        earth.geometry = SCNSphere(radius: 0.2)
        earth.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "EarthDay")
        earth.geometry?.firstMaterial?.specular.contents = UIImage(named: "EarthSpecular")
        earth.geometry?.firstMaterial?.emission.contents = UIImage(named: "EarthEmission")
        earth.geometry?.firstMaterial?.normal.contents = UIImage(named: "EarthNormal")
        earth.position = SCNVector3(0,0, -1)
        self.sceneView.scene.rootNode.addChildNode(earth)
        
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        let forever = SCNAction.repeatForever(action)
        earth.runAction(forever)
    }
    
    

}
extension Int {
    
    var degreesToRadians: Double { return Double(self) * .pi/180}
}
