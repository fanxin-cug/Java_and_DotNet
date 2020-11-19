package com.test;

public class IntroduceDemo {
    //姓名
    private String name;
    //年龄
    private  int  age;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * 自我介绍
     */
    public void introduce(){
        System.out.println("您好，我叫"+this.name+"今年"+this.age+"岁！");
    }
}
