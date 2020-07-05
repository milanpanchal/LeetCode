/*:
# Hamming Distance
  https://leetcode.com/explore/featured/card/july-leetcoding-challenge/544/week-1-july-1st-july-7th/3381/

 ---

### Problem Statement:
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

 Given two integers x and y, calculate the Hamming distance.

### Example:

 ```
 Input: x = 1, y = 4

 Output: 2

 Explanation:
 1   (0 0 0 1)
 4   (0 1 0 0)
        ↑   ↑

 The above arrows point to positions where the corresponding bits are different.
 ```
 
 ### Notes:
 + 0 ≤ x, y < 2^31
 
 */

import UIKit

class Solution {
    
//    149 / 149 test cases passed.
//    Status: Accepted
//    Runtime: 12 ms
//    Memory Usage: 20.9 MB

    func hammingDistance(_ x: Int, _ y: Int) -> Int {
     
        // Step 1: Find different bits
        let signedDifferentBits = x ^ y
        
        // We bitcast Int to UInt to allow the algorithm work correctly also for negative numbers.
        var differentBits: UInt = UInt(bitPattern: signedDifferentBits)
          
        // Step 2: Count them
        var counter = 0
        
        // Until there are some bits set to '1' in differentBits.
        while differentBits > 0 {
        
            // Mask differentBits with number 1 aka 00000001.
            // By doing this, we set all bits of differentBits
            // but the last one to zero.
            let maskedBits = differentBits & 1

            // If the last bit is not zero,
            if maskedBits != 0 {
                // increment the counter.
                counter += 1
            }
        
            // Shift bits in differentBits to the right.
            differentBits = differentBits >> 1
        }
        
        // We're done, return the number of 1s we've found.
        return counter
    }
    
    func hammingDistance2(_ x: Int, _ y: Int) -> Int {
        let diff = x ^ y
        var result = 0
        
        for char in String(diff, radix: 2) where char == "1" {
            result += 1
        }

        return result
    }
    
    func hammingDistance3(_ x: Int, _ y: Int) -> Int {
        return (x ^ y).nonzeroBitCount
    }
}

let sol = Solution()
sol.hammingDistance(1, 4) // 2
sol.hammingDistance2(1, 4) // 2
sol.hammingDistance3(1, 4) // 2

