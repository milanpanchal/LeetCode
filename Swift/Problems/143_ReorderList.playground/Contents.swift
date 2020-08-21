/*:
# 143. Reorder List [Medium]
  https://leetcode.com/problems/reorder-list/

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

// 13 / 13 test cases passed.
// Status: Accepted
// Runtime: 124 ms
// Memory Usage: 25.9 MB

class Solution {
    func reorderList(_ head: ListNode?) {
        if head?.next == nil {
            return
        }

        var odd  = head
        var even = head
        
        while even?.next?.next != nil {
            odd  = odd?.next
            even = even?.next?.next
        }
        
        let mid = odd
        let current = odd?.next
        while current?.next != nil {
            let cur       = current?.next
            current?.next = cur?.next
            
            cur?.next     = mid?.next
            mid?.next     = cur
        }
        
        odd = head
        even = mid?.next
        while odd !== mid {
            mid?.next  = even?.next
            even?.next = odd?.next
            odd?.next  = even
            odd        = even?.next
            even       = mid?.next
        }
    }
}

class Solution1 {
  func reorderList(_ head: ListNode?) {
    var slow = head, fast = head?.next?.next
    if fast == nil {
      return
    }
    
    if fast?.next == nil {
      head?.next?.next = nil
      fast?.next = head?.next
      head?.next = fast
      return
    }
    
    var depth = 0
    while fast?.next != nil {
      slow = slow?.next
      fast = fast?.next?.next
      depth += 1
    }
    
    if fast != nil {
      slow = slow?.next
    }
    
    let mid = slow?.next
    slow?.next = nil
    
    insert(head, mid, depth)
  }
  
  func insert(_ node: ListNode?, _ right: ListNode?, _ depth: Int) -> ListNode? {
    if depth == 0 {
      let rightNext = right?.next
      right?.next = node?.next
      node?.next = right
      return rightNext
    }
    
    let newRight = insert(node?.next, right, depth - 1)
    let rightNext = newRight?.next
    newRight?.next = node?.next
    node?.next = newRight
    return rightNext
  }
}


let node = ListNode(1)
node.next = ListNode(2)
node.next?.next = ListNode(3)
node.next?.next?.next = ListNode(4)

let sol = Solution()
sol.reorderList(node)
