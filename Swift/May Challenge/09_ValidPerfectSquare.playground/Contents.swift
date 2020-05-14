/*:
# Valid Perfect Square
  https://leetcode.com/explore/featured/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3324/

 ---

### Problem Statement:

 Given a positive integer num, write a function which returns True if num is a perfect square else False.


### Example:

 ```
 Input: 16
 Output: true

 Input: 14
 Output: false

 ```

 ### Notes:
 + Do not use any built-in library function such as sqrt.

 */

class Solution {
    
//    func isPerfectSquare(_ num: Int) -> Bool {
//        var x = num
//        while (x * x > num) {
//            x = (x + num / x) / 2
//        }
//        return x * x == num
//    }
    
    func isPerfectSquare(_ num: Int) -> Bool {
    
           if num < 1 {
               return false
           }
           
           if num == 1 {
               return true
           }
           
           var startIndex = 2
           var endIndex = num
           
           while startIndex < endIndex {
               
               let val = (endIndex + startIndex) / 2
               if val * val == num {
                   return true
               }
               
               if val * val > num {
                   endIndex = val
               } else {
                   startIndex = val + 1
               }
           }
           return false
       }
}

let obj = Solution()
for i in 1...100 {
    if obj.isPerfectSquare(i) {
        print(i)
    }
}

