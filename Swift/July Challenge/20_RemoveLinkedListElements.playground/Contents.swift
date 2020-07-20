/*:
# Remove Linked List Elements
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/546/week-3-july-15th-july-21st/3396/

 ---

### Problem Statement:

 Remove all elements from a linked list of integers that have value `val`.

### Example:

 ```
 Input:  1->2->6->3->4->5->6, val = 6
 Output: 1->2->3->4->5

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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
    }
}

let sol = Solution()

