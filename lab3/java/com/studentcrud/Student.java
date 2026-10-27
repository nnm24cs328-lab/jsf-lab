package com.studentcrud;

public class Student {
    private int rollNo;
    private String name;
    private String email;
    private int age;

    public Student() {
    }

    public Student(int rollNo, String name, String email, int age) {
        this.rollNo = rollNo;
        this.name = name;
        this.email = email;
        this.age = age;
    }

    public int getRollNo() {
        return rollNo;
    }

    public void setRollNo(int rollNo) {
        this.rollNo = rollNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
