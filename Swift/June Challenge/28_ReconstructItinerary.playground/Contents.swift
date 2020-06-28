/*:
# Reconstruct Itinerary
 
 https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/542/week-4-june-22nd-june-28th/3374/

 ---

### Problem Statement:

 Given a list of airline tickets represented by pairs of departure and arrival airports `[from, to]`, reconstruct the itinerary in order. All of the tickets belong to a man who departs from `JFK`. Thus, the itinerary must begin with `JFK`.


### Example 1:

 ```
 Input: [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
 
 Output: ["JFK", "MUC", "LHR", "SFO", "SJC"]

 ```
 
 ### Example 2:
  ```
 Input: [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
 
 Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
 
 Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"].
              But it is larger in lexical order.

  ```

 ### Notes:
 + If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string. For example, the itinerary `["JFK", "LGA"]` has a smaller lexical order than `["JFK", "LGB"]`.
 + All airports are represented by three capital letters (IATA code).
 + You may assume all tickets form at least one valid itinerary.
 + One must use all the tickets once and only once.
 
 */

import UIKit

class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        
    }
}

let sol = Solution()
sol.findItinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]])
