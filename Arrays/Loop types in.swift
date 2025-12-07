// Loop types in swift: 

// 1. For Loop
// 2. While Loop
// 3. Repeat While Loop
// 4. For Each Loop


// 5. For In Loop
let nums = [1, 2, 3, 4, 5]
for num in nums {
    print(num)
}

// 6. For in loop enumerated
for (index, num) in nums.enumerated() {
    print("Element at index \(index) is \(num)")
}

