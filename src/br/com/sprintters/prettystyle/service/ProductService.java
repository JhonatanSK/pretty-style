package br.com.sprintters.prettystyle.service;

import java.util.ArrayList;

import br.com.sprintters.prettystyle.dao.ProductCategoryDAO;
import br.com.sprintters.prettystyle.dao.ProductDAO;
import br.com.sprintters.prettystyle.model.ClientProductLike;
import br.com.sprintters.prettystyle.model.Product;
import br.com.sprintters.prettystyle.model.ProductCategory;

public class ProductService{
    ProductDAO productDAO;
    ProductCategoryDAO productCategoryDAO;

    public ProductService() {
        productDAO = new ProductDAO();
        productCategoryDAO = new ProductCategoryDAO();
    }

    public int create(Product product) throws Exception {
        try {
        	int idProduct = productDAO.insert(product);
        	
        	for (int i = 0; i < product.getCategories().size(); i++) {
        		ProductCategory pc = new ProductCategory(idProduct, product.getCategories().get(i).getId());
        		productCategoryDAO.insert(pc);
        	}
        	
        	return idProduct;
    	} catch (Exception e) {
    		throw new Exception(e.getMessage());
    	}
    }

    public void update(Product product) throws Exception {
        try {
        	productDAO.update(product);
    	} catch (Exception e) {
    		throw new Exception(e.getMessage());
    	}
    }

    public void delete(Product product) throws Exception {
        try {
        	productDAO.delete(product);
    	} catch (Exception e) {
    		throw new Exception(e.getMessage());
    	}
    }

    public Product find(int id) throws Exception {
    	try {
    		return productDAO.find(id);
    	} catch (Exception e) {
    		throw new Exception(e.getMessage());
    	}
    }

    public ArrayList<Product> list() throws Exception {
    	try {
    		return productDAO.list();
    	} catch (Exception e) {
    		throw new Exception(e.getMessage());
    	}
    }
    
    public ArrayList<Product> listBestSellers() throws Exception {
    	try {
    		ArrayList<Product> products = productDAO.listBestSellers();
    		
     		return products;
    	} catch (Exception e) {
    		throw new Exception(e.getMessage());
    	}
    }
    
    public ArrayList<Product> listByIdProvider(int idProvider) throws Exception {
    	try {
    		return productDAO.listByIdProvider(idProvider);
    	} catch (Exception e) {
    		throw new Exception(e.getMessage());
    	}
    }
    
    public int createFavorite(ClientProductLike cpl) throws Exception {
    	try {
    		return productDAO.createFavorite(cpl);
    	} catch (Exception e) {
    		throw new Exception(e.getMessage());
    	}
    }
    
    public ArrayList<ClientProductLike> listFavoritesByIdUser(int idUser) throws Exception {
    	try {
    		return productDAO.listFavoritesByIdUser(idUser);
    	} catch (Exception e) {
    		throw new Exception(e.getMessage());
    	}
    }
    
    public ClientProductLike listFavoriteByIdUserAndIdProduct(int idUser, int idProduct) throws Exception {
    	try {
    		return productDAO.listFavoriteByIdUserAndIdProduct(idUser, idProduct);
    	} catch (Exception e) {
    		throw new Exception(e.getMessage());
    	}
    }
    
    public void deleteFavoriteById(int id) throws Exception {
    	try {
    		productDAO.deleteFavoriteById(id);
    	} catch (Exception e) {
    		throw new Exception(e.getMessage());
    	}
    }
}
