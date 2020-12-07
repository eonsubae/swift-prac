// 여러 값들을 묶어서 변수로 표현할 수 있는 자료 구조
/* Array, Dictionary, Set */

/*
  Array - 순서가 있는 리스트 컬렉션
  Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
  Set - 순서가 없고, 멤버가 유일한 컬렉션
*/

// MARK: - Array
// 빈 배열 생성
var integers: Array<Int> = Array<Int>()
integers.append(1) // 배열의 뒤에 값을 추가
integers.append(100)
// integers.append(101.1) 타입이 다른 요소를 넣으면 에러 발생

integers.contains(100) // 배열 안에 인자와 같은 요소가 포함되어 있는지 체크
integers.contains(90)  // 결과에 따라 true or false를 리턴

integers.remove(at: 0) // 0번 인덱스에 있는 값을 없애기
integers.removeLast() // 마지막에 있는 값을 삭제하기
integers.removeAll() // 전부 삭제하기

integers.count // 배열 안의 요소들의 갯수

// Array<Double>과 [Double]은 동일한 표현이다
var doubles: Array<Double> = [Double]()
var strings: [String] = [String]()
var characters: [Character] = [] // []도 [Character]()와 동일하다

let immutableArray = [1, 2, 3] // 선언시 요소를 지정가능
// let을 사용해서 배열을 선언하면 변경이 불가능해진다
// immutableArray.append(4) 에러 발생
// immutableArray.removeAll() 에러 발생

// MARK: - Dictionary

var anyDictionary: Dictionary<String, Any> = [String: Any]()
// 값을 추가하기
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

// 값을 변경하기
anyDictionary["someKey"] = "dictionary"

// 값을 없애기
anyDictionary.removeValue(forKey: "anotherKey")

anyDictionary["someKey"] = nil

// let으로 선언한 딕셔너리도 변경이 불가능해진다
let emptyDictionary: [String: String] = [:] // 축약문법
// 선언과 동시에 값을 할당할 수는 있다
let initializeDictionary: [String: String] = ["name": "yagom", "gender": "male"]

emptyDictionary["key"] = "value"

// MARK: - Set
var intergerSet: Set<Int> = Set<Int>() // Set은 축약문법이 없다
intergerSet.insert(1)
intergerSet.insert(100)
intergerSet.insert(99)
intergerSet.insert(99)
intergerSet.insert(99) // Set에는 같은 값을 아무리 많이 넣어도 99는 하나만 저장된다

intergerSet.contains(1)
intergerSet.contains(2)

intergerSet.remove(100)
intergerSet.removeFirst()
intergerSet.count

let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

let union: Set<Int> = setA.union(setB) // 합집합을 구하는 메서드

let sortedUnion: [Int] = union.sorted() // 정렬하는 메서드를 호출하면 같은 타입의 배열로 반환이 된다

let intersection: Set<Int> = setA.intersection(setB) // 교집합을 구하는 메서드

let subtracting: Set<Int> = setA.subtracting(setB) // 차집합을 구하는 메서드
