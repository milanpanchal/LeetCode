/*:
# is Subset

 ---

### Problem Statement:
Write a function that takes two arrays as input, each array contains a list of A-Z; Your program should return `true` if the 2nd array is a subset of 1st array, or `false` if not.

### Example:

 ```
 Input: ["A", "B", "C", "D", "E"], ["A", "E", "D"]
 Output: true
 
 Input: ["A", "B", "C", "D", "E"], ["A", "D", "Z"]
 Output: false
 
 Input: ["A", "D", "E"], ["A", "A", "D", "E"]
 Output: true

 ```

 
 */


import UIKit

func isSubset(_ parentArray: [String], _ subArray: [String]) -> Bool {
    var counter = 0
    for  i in 0..<subArray.count {
        for j in 0..<parentArray.count {
            if subArray[i] == parentArray[j] {
                counter += 1
                break
            }
        }
    }
    return counter > 0 && counter == subArray.count
}

func isSubset2(_ parentArray: [String], _ subArray: [String]) -> Bool {

    for item in subArray {
        if !parentArray.contains(item) { return false }
    }
    
    return true
}

func isSubset3(_ parentArray: [String], _ subArray: [String]) -> Bool {

//    if subArray.count > parentArray.count {
//        return false
//    }
    
    var hashMap = [String: Int]()
    for pValue in parentArray {
        hashMap[pValue, default:0] += 1
    }
    
    for sValue in subArray {
//        if let val = hashMap[sValue] {
//            hashMap[sValue] = (val == 1) ? nil : val - 1
//        } else {
//            return false
//        }
        
        if hashMap[sValue] == nil {
            return false
        }
    }

    return true
}

isSubset3(["A", "B", "C", "D", "E"], ["A", "E", "D"])
isSubset3(["A", "B", "C", "D", "E"], ["A", "D", "Z"])
isSubset3(["A", "D", "E"], ["A", "A", "D", "E"])

