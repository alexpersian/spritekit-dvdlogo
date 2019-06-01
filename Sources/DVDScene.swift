import SpriteKit

public class DVDScene: SKScene {

  private let dvdNode: SKNode
  private var moveTransform = CGAffineTransform(translationX: 1.0, y: 1.0)
  private var changeColor: SKAction {
    return SKAction.colorize(with: UIColor.generateRandomColor(), colorBlendFactor: 1.0, duration: 0)
  }

  public init(node: SKNode, size: CGSize) {
    self.dvdNode = node
    super.init(size: size)
    setup()
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  private func setup() {
    addChild(dvdNode)
    dvdNode.run(changeColor)
  }

  // Update is called once per frame
  public override func update(_ currentTime: TimeInterval) {
    // Collect a reference frame for the node's current position
    let currentFrame = dvdNode.calculateAccumulatedFrame()

    // Top bound
    if currentFrame.maxY >= self.frame.maxY {
      moveTransform.ty = -1.0
      dvdNode.run(changeColor)
    }

    // Right bound
    if currentFrame.maxX >= self.frame.maxX {
      moveTransform.tx = -1.0
      dvdNode.run(changeColor)
    }

    // Bottom bound
    if currentFrame.minY <= self.frame.minY {
      moveTransform.ty = 1.0
      dvdNode.run(changeColor)
    }

    // Left bound
    if currentFrame.minX <= self.frame.minX {
      moveTransform.tx = 1.0
      dvdNode.run(changeColor)
    }

    // Update the node's position by applying the transform
    dvdNode.position = dvdNode.position.applying(moveTransform)
  }
}

private extension UIColor {
  static func generateRandomColor() -> UIColor {
    let hue = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    return UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1) // Max saturation, max brightness
  }
}
