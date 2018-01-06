package com.main;

import com.user.User;
import com.draw.Shape;

public class MainClass {

    public static void main(String[] args) {

        User user = new User();
        Shape shape = user.getShape();
        System.out.println("Shape is - " + shape);
    }
}