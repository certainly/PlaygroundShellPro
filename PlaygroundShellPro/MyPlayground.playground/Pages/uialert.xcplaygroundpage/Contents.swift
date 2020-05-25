import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
let window = UIWindow()
let viewController = UIViewController()
window.rootViewController = viewController
window.makeKeyAndVisible()

let alert = UIAlertController(title: "title here", message: "message here", preferredStyle: .alert)
alert.addAction(UIAlertAction(title: "action here", style: .default, handler: nil))
let u1 = UIAlertController(title: "alertcer", cancelButtonTitle: "cancelcer", okButtonTitle: "okcer", allowEmptyText: false) { (resul) in
    print("ok now")
}
viewController.present(u1, animated: true, completion: nil)
PlaygroundPage.current.liveView = window
