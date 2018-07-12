import UIKit
import PlaygroundSupport

let ss = "202,203,206,1"

 func getColorFromRGBStr(_ colorStr: String?) -> UIColor? {
    guard colorStr != nil else {
        return nil
    }
    let tArrSplited = colorStr?.components(separatedBy: ",")
    guard let tArr = tArrSplited, tArr.count == 4 else {
        return nil
    }
    let tArrFloat = tArr.map{  CGFloat(( $0 as NSString).floatValue)}

    return UIColor(red: (tArrFloat[0]) / 255.0, green: (tArrFloat[1]) / 255.0, blue: (tArrFloat[2]) / 255.0, alpha: tArrFloat[3])
}

getColorFromRGBStr(ss)
