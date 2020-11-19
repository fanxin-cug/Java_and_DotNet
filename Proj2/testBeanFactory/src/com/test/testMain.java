package com.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class testMain {
    public static void main(String[] args) {
        //创建Spring上下文（加载bean.xml）
        ApplicationContext acx= new ClassPathXmlApplicationContext("bean.xml");
        //获取HelloWorld实例
        IntroduceDemo id=acx.getBean("IntroduceDemo",IntroduceDemo.class);
        //调用方法
        id.introduce();
    }
}
