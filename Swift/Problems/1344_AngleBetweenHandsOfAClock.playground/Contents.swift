/*:
# 1344. Angle Between Hands of a Clock
  https://leetcode.com/problems/angle-between-hands-of-a-clock/

 ---

### Problem Statement:
 
 Given two numbers, `hour` and `minutes`. Return the smaller angle (in degrees) formed between the `hour` and the `minute` hand.

### Example:

 ```
 Input: hour = 12, minutes = 30
 Output: 165

 Input: hour = 3, minutes = 30
 Output: 75

 Input: hour = 3, minutes = 15
 Output: 7.5

 Input: hour = 4, minutes = 50
 Output: 155

 Input: hour = 12, minutes = 0
 Output: 0
 
 ```
 
 ### Constraints:
 + 1 <= hour <= 12
 + 0 <= minutes <= 59
 + Answers within `10^-5` of the actual value will be accepted as correct.

 ### Hint:
 + The tricky part is determining how the minute hand affects the position of the hour hand.
 + Calculate the angles separately then find the difference.
 
 */

import UIKit

class Solution {
//    105 / 105 test cases passed.
//    Status: Accepted
//    Runtime: 12 ms
//    Memory Usage: 20.8 MB

    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let hoursAngle = (Double(hour % 12) + Double(minutes) / 60) * 30
        let minutesAngle = Double(minutes*6)
        let angle = abs(hoursAngle - minutesAngle)
        if angle > 180 { return 360 - angle }
        return angle
    }
}

let sol = Solution()
sol.angleClock(12, 30) // 165
sol.angleClock(3, 30) // 75
sol.angleClock(3, 15) // 7.5
sol.angleClock(4, 50) // 155
sol.angleClock(12, 0) // 0
