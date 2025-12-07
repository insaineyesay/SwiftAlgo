// Intersection of Two Arrays II

// Solution
// Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

 

// Example 1:

// Input: nums1 = [1,2,2,1], nums2 = [2,2]
// Output: [2,2]
// Example 2:

// Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
// Output: [4,9]
// Explanation: [9,4] is also accepted.
 

// Constraints:

// 1 <= nums1.length, nums2.length <= 1000
// 0 <= nums1[i], nums2[i] <= 1000
 

// Follow up:

// What if the given array is already sorted? How would you optimize your algorithm?
// What if nums1's size is small compared to nums2's size? Which algorithm is better?
// What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var smaller = nums1.count > nums2.count ? nums2 : nums1
        var larger = nums1.count > nums2.count ? nums1 : nums2
        var dict: [Int: Int] = [:]
        var result: [Int] = []
        
        for el in smaller {
            dict[el, default: 0] += 1
        }

        for num in larger {
            if let count = dict[num], count > 0 {
                result.append(num)
                dict[num] = count - 1
            }
        }
        return result
    }
}

// Guidelines Recap:
// 	•	Using a dictionary for frequency counting is practical when you want to find common elements regardless of order.
// 	•	Remember to choose the smaller array for building the dictionary to optimize space and reduce iterations