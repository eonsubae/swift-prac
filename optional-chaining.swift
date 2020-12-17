/* 옵셔널 체이닝 */
/*
  옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로 
  또 다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있다
*/

class Person {
  var name: String
  var job: String?
  var home: Apartment?

  init(name: String) {
    self.name = name
  }
}

class Apartment {
  var buildingNumber: String
  var roomNumber: String
  var `guard`: Person?
  var owner: Person?

  init(dong: String, ho: String) {
    buildingNumber = dong
    roomNumber = ho
  }
}

let esbae: Person? = Person(name: "esbae")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

/* 옵셔널 체이닝이 실행 후 결과앖이 nil일 수 있으므로
   결과 타입도 옵셔널이다
*/

// 만약 경비원의 직업이 궁금하다면?

// 옵셔널 체이닝을 사용하지 않았을 때
func guardJob(owner: Person?) {
  if let owner = owner {
    if let home = owner.home {
      if let `guard` = home.guard {
        if let guardJob = `guard`.job {
          print("우리집 경비원의 직업은 \(guardJob)입니다")
        } else {
          print("우리집 경비원은 직업이 없어요")
        }
      }
    }
  }
}

guardJob(owner: esbae)

// 옵셔널 체이닝을 사용
func guardJobWithOptionalChaining(owner: Person?) {
  if let guardJob = owner?.home?.guard?.job {
    print("우리집 경비원의 직업은 \(guardJob)입니다")
  } else {
    print("우리집 경비원은 직업이 없어요")
  }
}

guardJobWithOptionalChaining(owner: esbae) // 우리집 경비원은 직업이 없어요

esbae?.home?.guard?.job // nil 집이 없으므로 home?단계에서 nil이 반환되며 끝이 난다

esbae?.home = apart

esbae?.home // Optional(Apartment)
esbae?.home?.guard // nil guard가 없으므로 nil이 반환된다

esbae?.home?.guard = superman

esbae?.home?.guard // Optional(Person)

esbae?.home?.guard?.name // superman
esbae?.home?.guard?.job // nil

esbae?.home?.guard?.job = "경비원"

// nil 병합 연산자 - 옵셔널 체이닝의 결과 중간에 요소가 존재하지 않을 때 nil이 반환되는데 이 때 기본값을 쓰고 싶을 때 사용한다

var guardJob: String

guardJob = esbae?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 경비원

esbae?.home?.guard?.job = nil

guardJob = esbae?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 슈퍼맨
