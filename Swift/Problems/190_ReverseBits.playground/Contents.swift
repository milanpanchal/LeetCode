/*:
# Reverse Bits
  https://leetcode.com/problems/reverse-bits/

 ---

### Problem Statement:
 Reverse bits of a given 32 bits unsigned integer.

### Example 1:

 ```
 Input: 00000010100101000001111010011100
 Output: 00111001011110000010100101000000

 Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.

 ```
 
 ### Example 2:

 ```
 Input: 11111111111111111111111111111101
 Output: 10111111111111111111111111111111
 
 Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111.
 
 ```
 
 ### Notes:
 + Note that in some languages such as Java, there is no unsigned integer type. In this case, both input and output will be given as signed integer type and should not affect your implementation, as the internal binary representation of the integer is the same whether it is signed or unsigned.

 + In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above the input represents the signed integer `-3` and the output represents the signed integer `-1073741825`.
 
 ### Follow up:

 If this function is called many times, how would you optimize it?

 */

import UIKit

class Solution {
    
//    600 / 600 test cases passed.
//    Status: Accepted
//    Runtime: 20 ms
//    Memory Usage: 20 MB

    func reverseBits(_ n: Int) -> Int {
        var n = n
        var revBits = 0
        
        for i in 0..<32 {
            revBits += (n & 1)
            n >>= 1
            if i < 31 {
                revBits <<= 1
            }
        }
        
        return revBits
    }
}

let sol = Solution()
sol.reverseBits(43261596) // 964176192
sol.reverseBits(4294967293) // 3221225471

