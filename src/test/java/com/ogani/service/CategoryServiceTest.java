package com.ogani.service;

import com.ogani.entity.Category;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.sql.Timestamp;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CategoryServiceTest {

    private static final CategoryService categoryService = new CategoryService();

    @Test
    public void testCreate() {
        Category category = new Category();
        category.setName("Rau sạch");
        category.setImage("rau.png");
        categoryService.save(category);

        assertNotEquals(0, category.getId());
    }

    @Test
    public void testGet() {
        int id = 4;
        Category category = categoryService.get(id);
        System.out.println(category);
        assertNotNull(category);
    }

    @Test
    public void testGetFail() {
        int id = 2;
        Category category = categoryService.get(id);
        System.out.println(category);
        assertNull(category);
    }

    @Test
    public void testList() {
        List<Category> list = categoryService.list("Hoạt động");
        assertNotEquals(0, list.size());
    }

    @Test
    public void testUpdate() {
        int id = 4;
        Category category = categoryService.get(id);
        category.setImage("ràu.png");
        category.setName("Rau hơi có màu tí");
        category.setUpdatedAt(new Timestamp(System.currentTimeMillis()));

        categoryService.update(category);

        System.out.println(category);

        assertEquals("ràu.png", category.getImage());
    }

    @Test
    public void testDelete() {
        int id = 4;
        categoryService.delete(id);
        assertNull(categoryService.get(id));
    }
}