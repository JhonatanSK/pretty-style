package br.com.sprintters.prettystyle.command.catalog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import br.com.sprintters.prettystyle.command.Command;
import br.com.sprintters.prettystyle.model.Category;
import br.com.sprintters.prettystyle.model.Product;
import br.com.sprintters.prettystyle.model.generic.Json;
import br.com.sprintters.prettystyle.service.CategoryService;
import br.com.sprintters.prettystyle.service.ProductService;

public class ListByProductName implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
		try {
			HttpSession session = request.getSession();
			
			boolean isJson = Boolean.parseBoolean(request.getParameter("json"));
			
			ProductService ps = new ProductService();
			CategoryService cs = new CategoryService();

			
			String search = request.getParameter("search");
			
			ArrayList<Category> categories = cs.list();
			int quantityProduct = ps.findByNameCount(search);
			ArrayList<Product> products = ps.findByName(search);
			
			int quantityPages = (quantityProduct / 16);
			
			if(quantityPages < 1 && quantityPages >= 0) quantityPages = 1;
			
			ArrayList<Integer> pages = new ArrayList<Integer>();
			
			for(int i = 1; i <= quantityPages; i++) {
				pages.add(i);
			}
			
			if (isJson) {
				Json json = new Json(true, "", products);
				
				response.setContentType("application/json");
				response.getWriter().write(new Gson().toJson(json).toString());
			} else {
				session.setAttribute("products", products);
				session.setAttribute("categories", categories);
				session.setAttribute("quantityProduct", quantityProduct);
				session.setAttribute("quantityPages", pages);

				response.sendRedirect("/PrettyStyle/App/pages/catalog/catalog.jsp");
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}
}
