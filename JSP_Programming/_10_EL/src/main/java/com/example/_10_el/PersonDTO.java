package com.example._10_el; // 자바빈즈 규약 1번: 패키지 내부에 있어야 한다.

public class PersonDTO {
    // 자바빈즈 규약 2번: private 멤버 변수
    private String name;
    private int age;

    // 자바빈즈 규약 3번: 기본 생성자
    public PersonDTO() {}

    // 모든 속성을 초기화 해주는 생성자
    public PersonDTO(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // 자바빈즈 규약 4번: getter/setter
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
