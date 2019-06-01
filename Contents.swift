import SpriteKit
import PlaygroundSupport

let viewFrame = CGRect(x: 0, y: 0, width: 400, height: 400)
let view = SKView(frame: viewFrame)

let dvdNode = SKSpriteNode(imageNamed: "dvd-logo.png")
dvdNode.size = CGSize(width: 100, height: 47)

let mainScene = DVDScene(node: dvdNode, size: view.frame.size)
mainScene.anchorPoint = CGPoint(x: 0.5, y: 0.5) // Set the origin to the mid-point of the scene
mainScene.backgroundColor = .black

view.presentScene(mainScene)
PlaygroundPage.current.liveView = view
