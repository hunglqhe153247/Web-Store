/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Comparator;

/**
 *
 * @author Hung
 */
public class Product {

    String id;
    String name;
    float price;
    String unit;
    String category;
    String imagie;
    String description;
    String supplier;

    public Product() {
    }

    public Product(String id, String name, float price, String unit, String category, String imagie, String description, String supplier) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.unit = unit;
        this.category = category;
        this.imagie = imagie;
        this.description = description;
        this.supplier = supplier;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    

    

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImagie() {
        return imagie;
    }

    public void setImagie(String imagie) {
        this.imagie = imagie;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    public static Comparator<Product> ProductNameComparatorAsc = new Comparator<Product>() {

        public int compare(Product s1, Product s2) {
            String ProductName1 = s1.getName().toUpperCase();
            String ProductName2 = s2.getName().toUpperCase();

            //ascending order
            return ProductName1.compareTo(ProductName2);

            
        }
    };
    public static Comparator<Product> ProductNameComparatorDes = new Comparator<Product>() {

        public int compare(Product s1, Product s2) {
            String ProductName1 = s1.getName().toUpperCase();
            String ProductName2 = s2.getName().toUpperCase();


            return ProductName2.compareTo(ProductName1);

        }
    };
    public static Comparator<Product> ProductPriceComparatorAsc = new Comparator<Product>() {

        public int compare(Product s1, Product s2) {
            float ProductPrice1 = s1.getPrice();
            float ProductPrice2 = s2.getPrice();

            //ascending order
            return (int) (ProductPrice1 - ProductPrice2);

            
        }
    };
    public static Comparator<Product> ProductPriceComparatorDes = new Comparator<Product>() {

        public int compare(Product s1, Product s2) {
            float ProductPrice1 = s1.getPrice();
            float ProductPrice2 = s2.getPrice();

            
            return (int) (ProductPrice2 - ProductPrice1);

            //descending order
            
        }
    };

}
