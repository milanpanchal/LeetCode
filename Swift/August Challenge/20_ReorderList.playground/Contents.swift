/*:
# Reorder List
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3430/

 ---

### Problem Statement:

 Given a singly linked list L: L0→L1→…→Ln-1→Ln,
 reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…

 You may not modify the values in the list's nodes, only nodes itself may be changed.


### Example:

 ```
 Given 1->2->3->4, reorder it to 1->4->2->3.

 Given 1->2->3->4->5, reorder it to 1->5->2->4->3.

 ```
 
 */

import UIKit

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        
    }
}

let sol = Solution()

