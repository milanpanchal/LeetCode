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
    

//    110 / 110 test cases passed.
//    Status: Accepted
//    Runtime: 32 ms
//    Memory Usage: 25.6 MB

    func reformatDate(_ date: String) -> String {
        let date = date
            .replacingOccurrences(of: "st", with: "")
            .replacingOccurrences(of: "nd", with: "")
            .replacingOccurrences(of: "rd", with: "")
            .replacingOccurrences(of: "th", with: "")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        if let dateInDate = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: dateInDate)
        }

        
        return ""
    }
    
    func reformatDate3(_ date: String) -> String {
        let splited: [String] = date.split(separator: " ").map{ String($0) }
        let monthMap = ["Jan": "01",
                        "Feb": "02",
                        "Mar": "03",
                        "Apr": "04",
                        "May": "05",
                        "Jun": "06",
                        "Jul": "07",
                        "Aug": "08",
                        "Sep": "09",
                        "Oct": "10",
                        "Nov": "11",
                        "Dec": "12"]
        
        var first = splited[0]
        first.removeLast(2)
        
        if first.count == 1 {
            first = "0" + first
        }
        return "\(splited[2])-\(monthMap[splited[1]]!)-\(first)"
    }
}

let sol = Solution()
sol.reformatDate("20th Oct 2052")   // 2052-10-20
sol.reformatDate("6th Jun 1933")    // 1933-06-06
sol.reformatDate("26th May 1960")   // 1960-05-26
sol.reformatDate("1st May 1960")   // 1960-05-26

