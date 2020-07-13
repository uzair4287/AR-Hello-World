//
//  ViewController.swift
//  AR 1
//
//  Created by Anosh Zubin Bulsara on 7/12/20.
//  Copyright © 2020 Uzair Makda. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = SCNText(string: "This is the first AR app by Uzair.", extrusionDepth: 4)
        sceneView.delegate = self
        let material = SCNMaterial();                     material.diffuse.contents = UIColor.blue;             text.materials = [material]
        
        let node = SCNNode();                                     node.position = SCNVector3(x:-1, y:0, z:-3);             node.scale = SCNVector3(x:0.01, y:0.01, z:0.01);          node.geometry = text
        
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
        
        sceneView.showsStatistics = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
       // Create a session configuration
       let configuration = ARWorldTrackingConfiguration()
       
       // Enable horizontal plane detection
       configuration.planeDetection = .horizontal
       
       // show Feature Points
       sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

       // Run the view's session
       sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
