/*:
 # First Bad Version
 ---
 
 ### Problem Statement:
 
 You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

 You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

 ### Example:
 
 ```
 Given n = 5, and version = 4 is the first bad version.

 call isBadVersion(3) -> false
 call isBadVersion(5) -> true
 call isBadVersion(4) -> true

 Then 4 is the first bad version.
 ```
 */

/**
  * The knows API is defined in the parent class VersionControl.
  *     func isBadVersion(_ version: Int) -> Bool{}
  */
 
 
 class VersionControl {
    static let badVersion = 7
    
    func isBadVersion(_ version: Int) -> Bool{
        return version >= VersionControl.badVersion
    }
    
 }
 
 class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        
        var firstIndex = 0
        var lastIndex = n
        
        var midValue = n/2
        
        while firstIndex < lastIndex {
            
            if isBadVersion(midValue) {
                lastIndex = midValue
            } else {
                firstIndex = midValue + 1
            }
            midValue = (firstIndex + lastIndex) / 2
            
        }
        
        return midValue
        
    }
 }
 
 let obj = Solution()
 print(obj.firstBadVersion(10))
 print(obj.firstBadVersion(11))
 
