/*:
# Online Stock Span
  https://leetcode.com/explore/featured/card/may-leetcoding-challenge/536/week-3-may-15th-may-21st/3334/

 ---

### Problem Statement:

 Write a class `StockSpanner` which collects daily price quotes for some stock, and returns the span of that stock's price for the current day.

 The span of the stock's price today is defined as the maximum number of consecutive days (starting from today and going backwards) for which the price of the stock was less than or equal to today's price.

 For example, if the price of a stock over the next 7 days were `[100, 80, 60, 70, 60, 75, 85]`, then the stock spans would be `[1, 1, 1, 2, 1, 4, 6]`.


### Example:

 ```
 Input: ["StockSpanner","next","next","next","next","next","next","next"], [[],[100],[80],[60],[70],[60],[75],[85]]
 Output: [null,1,1,1,2,1,4,6]
 Explanation:
 First, S = StockSpanner() is initialized.  Then:
 S.next(100) is called and returns 1,
 S.next(80) is called and returns 1,
 S.next(60) is called and returns 1,
 S.next(70) is called and returns 2,
 S.next(60) is called and returns 1,
 S.next(75) is called and returns 4,
 S.next(85) is called and returns 6.

 Note that (for example) S.next(75) returned 4, because the last 4 prices
 (including today's price of 75) were less than or equal to today's price.
 ```
 
 ### Notes:
 + Calls to `StockSpanner.next(int price)` will have `1 <= price <= 10^5`.
 + There will be at most `10000` calls to `StockSpanner.next` per test case.
 + There will be at most `150000` calls to `StockSpanner.next` across all test cases.
 + The total time limit for this problem has been reduced by 75% for C++, and 50% for all other languages.
 
 */
import UIKit


// Solution 1: Brute force solution
/*class StockSpanner {

    var priceList = [Int]()
    
    init() {
    }
    
    func next(_ price: Int) -> Int {
        
        priceList.append(price)
        if priceList.count == 1 { return 1 }
        
        var spanValue = 0
        
        for j in stride(from: priceList.count-1, through: 0, by: -1) {
            if priceList[j] > price {
                break
            }
            spanValue += 1
        }
        return spanValue
        
    }
}*/

class StockSpanner {

    var stack = [(price: Int, count: Int)]()
    init() {
    }
    
    func next(_ price: Int) -> Int {
        
        var count = 1
        while !stack.isEmpty, stack.last!.price <= price { // (stack.last?.price ?? Int.max) <= price
            count += stack.removeLast().count
        }
        stack.append((price, count))
        return count
    }
}



 // Your StockSpanner object will be instantiated and called as such:
 let obj = StockSpanner()

let prices = [100, 80, 60, 70, 60, 75, 85]

for p in prices {
    let response = obj.next(p)
    print("\(response)")
    
}

 
