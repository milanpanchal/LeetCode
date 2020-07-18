/*:
# 1507. Reformat Date
  https://leetcode.com/problems/reformat-date/

 ---

### Problem Statement:

 Given a `date` string in the form `Day Month Year`, where:
 + Day is in the set `{"1st", "2nd", "3rd", "4th", ..., "30th", "31st"}`.
 + Month is in the set `{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}`.
 + Year is in the range `[1900, 2100]`.

 Convert the date string to the format `YYYY-MM-DD`, where:
 + `YYYY` denotes the 4 digit year.
 + `MM` denotes the 2 digit month.
 + `DD` denotes the 2 digit day.


### Example:

 ```
 Input: date = "20th Oct 2052"
 Output: "2052-10-20"

 Input: date = "6th Jun 1933"
 Output: "1933-06-06"

 Input: date = "26th May 1960"
 Output: "1960-05-26"
 
 ```
 
 ### Constraints:
 + The given dates are guaranteed to be valid, so no error handling is necessary.

 
 */

import UIKit

class Solution {
    func reformatDate(_ date: String) -> String {
     
        return ""
    }
}

let sol = Solution()
sol.reformatDate("20th Oct 2052")   // 2052-10-20
sol.reformatDate("6th Jun 1933")    // 1933-06-06
sol.reformatDate("26th May 1960")   // 1960-05-26

