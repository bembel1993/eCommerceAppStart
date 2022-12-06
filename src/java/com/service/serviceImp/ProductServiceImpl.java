package com.service.serviceImp;

import com.dao.ProductDao;
import com.dao.daoImp.ProductDaoImpl;
import com.model.Product;
import org.hibernate.HibernateError;

public class ProductServiceImpl {
    ProductDao productDao = new ProductDaoImpl();
    public ProductServiceImpl(){}

    public boolean addProd(Product product) {
        boolean isAdded = false;
        try {
            if (productDao.addProd(product))
                isAdded = true;
        }
        catch (HibernateError e) {
            // ShowException.showNotice(e);
        }
        return isAdded;
    }
}
