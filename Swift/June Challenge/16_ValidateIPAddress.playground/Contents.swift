/*:
# Validate IP Address
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/541/week-3-june-15th-june-21st/3362/

 ---

### Problem Statement:
 
 Write a function to check whether an input string is a valid IPv4 address or IPv6 address or neither.

 IPv4 addresses are canonically represented in dot-decimal notation, which consists of four decimal numbers, each ranging from 0 to 255, separated by dots ("."), e.g.,`172.16.254.1`;

 Besides, leading zeros in the IPv4 is invalid. For example, the address `172.16.254.01` is invalid.

 IPv6 addresses are represented as eight groups of four hexadecimal digits, each group representing 16 bits. The groups are separated by colons (":"). For example, the address `2001:0db8:85a3:0000:0000:8a2e:0370:7334` is a valid one. Also, we could omit some leading zeros among four hexadecimal digits and some low-case characters in the address to upper-case ones, so `2001:db8:85a3:0:0:8A2E:0370:7334` is also a valid IPv6 address(Omit leading zeros and using upper cases).

 However, we don't replace a consecutive group of zero value with a single empty group using two consecutive colons (::) to pursue simplicity. For example, `2001:0db8:85a3::8A2E:0370:7334` is an invalid IPv6 address.

 Besides, extra leading zeros in the IPv6 is also invalid. For example, the address `02001:0db8:85a3:0000:0000:8a2e:0370:7334` is invalid.

### Example:

 ```
 Input: "172.16.254.1"
 Output: "IPv4"

 Input: "2001:0db8:85a3:0:0:8A2E:0370:7334"
 Output: "IPv6"

 Input: "256.256.256.256"
 Output: "Neither"

 ```

 ### Notes:
 + You may assume there is no extra space or special characters in the input string.
 
 */
import UIKit

func validIPAddress(_ IP: String) -> String {
 
    let ipv4RegEx = "^(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$"
    if IP.range(of: ipv4RegEx, options: .regularExpression) != nil {
        return "IPv4"
    }
    
    /*if NSPredicate(format:"SELF MATCHES %@", ipv4RegEx).evaluate(with: IP) {
        return "IPv4"
    }*/

    let ipv6RegEx = "^(([0-9a-fA-F]{1,4})\\:){7}([0-9a-fA-F]{1,4})$"
    if IP.range(of: ipv6RegEx, options: .regularExpression) != nil {
        return "IPv6"
    }

    /*if NSPredicate(format:"SELF MATCHES %@", ipv6RegEx).evaluate(with: IP) {
        return "IPv6"
    }*/
    
    return "Neither"
}

validIPAddress("172.16.254.1") // IPv4
validIPAddress("172.16.254.01") // Neither
validIPAddress("2001:0db8:85a3:0000:0000:8a2e:0370:7334") // IPv6
validIPAddress("2001:db8:85a3:0:0:8A2E:0370:7334") // IPv6
validIPAddress("2001:0db8:85a3::8A2E:0370:7334") // Neither

