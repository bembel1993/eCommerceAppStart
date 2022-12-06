package com.model;

import java.util.ArrayList;
import java.util.List;

public class ListService {
    private static List<Product> groupList = new ArrayList();

    static {
     //   groupList.add(new Product("galaxy s21 ultra", "350$", "Samsung", "2022"));
    }

    static public List<Product> retrieveList() {
        System.out.println(groupList);
        return groupList;
    }

    static public void addProduct1(Product product) {
        groupList.add(new Product(product));
    }
}
