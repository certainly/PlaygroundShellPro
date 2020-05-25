import Foundation
import PlaygroundSupport
import UIKit

print("67jk444j07")
//#warning("todo: updatejj")



////////////////////////////////
//PlaygroundPage.current.needsIndefiniteExecution = true


extension UIView {
    func bounceOut(duration: TimeInterval)  {
        UIView.animate(withDuration: duration) {
            [unowned self] in
            self.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        }
    }
}

extension Int {
    func times(_ closure: () -> Void) {
        guard self > 0 else {
            return
        }
        for _ in 0 ..< self {
            closure()
        }
    }
}

extension Array where Element: Comparable  {
    mutating func remove(item: Element)  {
        if let location = self.firstIndex(of: item) {
            self.remove(at: location)
        }
    }

}

// some test code to make sure everything works
let view = UIView()
view.bounceOut(duration: 3)

5.times { print("Hello") }

var numbers = [1, 2, 3, 4, 5]
numbers.remove(item: 3)

let view1 = UIView(frame:CGRect(x:0, y:0, width:200, height:500))

view1.backgroundColor=UIColor.blue


PlaygroundPage.current.liveView=view1
view1.bounceOut(duration: 3)
