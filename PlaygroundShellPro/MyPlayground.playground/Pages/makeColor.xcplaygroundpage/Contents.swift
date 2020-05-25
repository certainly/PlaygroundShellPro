import UIKit
import PlaygroundSupport

let ss = "34,153,175,1"

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

public  func fromHex(_ hex: String) -> UIColor {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if cString.hasPrefix("#") {
        cString.remove(at: cString.startIndex)
    }

    if cString.count != 6 {
        return .gray
    }

    var rgbValue: UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

getColorFromRGBStr(ss)

let tt = "Moreee"
tt.contains("More")
fromHex("76879D")
