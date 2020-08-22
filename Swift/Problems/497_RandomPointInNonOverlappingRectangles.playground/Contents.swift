/*:
# 497. Random Point in Non-overlapping Rectangles [Medium]
  https://leetcode.com/problems/random-point-in-non-overlapping-rectangles/

 ---

### Problem Statement:

 Given a list of non-overlapping axis-aligned rectangles `rects`, write a function `pick` which randomly and uniformily picks an integer point in the space covered by the rectangles.

 ### Notes:
 + An integer point is a point that has integer coordinates.
 + A point on the perimeter of a rectangle is included in the space covered by the rectangles.
 + `i`th rectangle = `rects[i]` = `[x1,y1,x2,y2]`, where `[x1, y1]` are the integer coordinates of the bottom-left corner, and `[x2, y2]` are the integer coordinates of the top-right corner.
 + length and width of each rectangle does not exceed `2000`
 + `1 <= rects.length <= 100`
 + `pick` return a point as an array of integer coordinates `[p_x, p_y]`
 + `pick` is called at most `10000` times.


 
### Example 1:

 ```
 Input:
 ["Solution","pick","pick","pick"]
 [[[[1,1,5,5]]],[],[],[]]
 Output:
 [null,[4,1],[4,1],[3,3]]

 ```
 
 ### Example 2:

 ```
 Input:
 ["Solution","pick","pick","pick"]
 [[[[1,1,5,5]]],[],[],[]]
 Output:
 [null,[4,1],[4,1],[3,3]]

 ```
 
 ### Explanation of Input Syntax:
 
 The input is two lists: the subroutines called and their arguments. `Solution`'s constructor has one argument, the array of rectangles `rects`. `pick` has no arguments. Arguments are always wrapped with a list, even if there aren't any.

 */


import UIKit

// 35 / 35 test cases passed.
// Status: Accepted
// Runtime: 344 ms
// Memory Usage: 23.7 MB

class Solution {
    var rects: [[Int]]
    var areas: [Int]
    var totalArea = 0
    
    init(_ rects: [[Int]]) {
        self.rects = rects
        areas = [Int]()
        
        for rect in rects {
            totalArea += (rect[2] - rect[0] + 1) * (rect[3] - rect[1] + 1)
            areas.append(totalArea)
        }
    }
    
    func pick() -> [Int] {
        let random = Int.random(in: 0..<totalArea)
        
        for (index, area) in areas.enumerated() {
            if area > random {
                let rect = rects[index]
                let x = Int.random(in: rect[0]...rect[2])
                let y = Int.random(in: rect[1]...rect[3])
                return [x, y]
            }
        }
        
        return []
    }
}

let rects1 = [[1,1,5,5]]
let rects2 = [[-2,-2,-1,-1],[1,0,3,0]]

let obj = Solution(rects1)
let ret_1: [Int] = obj.pick()

