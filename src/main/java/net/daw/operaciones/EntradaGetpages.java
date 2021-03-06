/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.operaciones;

import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.daw.dao.EntradaDao;
import net.daw.helper.Conexion;
import net.daw.helper.FilterBean;


/**
 *
 * @author rafa
 */
public class EntradaGetpages implements GenericOperation {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String data;
        try {
            int rpp;
            if (request.getParameter("rpp") == null) {
                rpp = 10;
            } else {
                rpp = Integer.parseInt(request.getParameter("rpp"));
            }
            ArrayList<FilterBean> alFilter = new ArrayList<>();
            if (request.getParameter("filter") != null) {
                if (request.getParameter("filteroperator") != null) {
                    if (request.getParameter("filtervalue") != null) {
                        FilterBean oFilterBean = new FilterBean();
                        oFilterBean.setFilter(request.getParameter("filter"));
                        oFilterBean.setFilterOperator(request.getParameter("filteroperator"));
                        oFilterBean.setFilterValue(request.getParameter("filtervalue"));
                        oFilterBean.setFilterOrigin("user");
                        alFilter.add(oFilterBean);
                    } 
                } 
            } 
            if (request.getParameter("systemfilter") != null) {
                if (request.getParameter("systemfilteroperator") != null) {
                    if (request.getParameter("systemfiltervalue") != null) {
                        FilterBean oFilterBean = new FilterBean();
                        oFilterBean.setFilter(request.getParameter("systemfilter"));
                        oFilterBean.setFilterOperator(request.getParameter("systemfilteroperator"));
                        oFilterBean.setFilterValue(request.getParameter("systemfiltervalue"));
                        oFilterBean.setFilterOrigin("system");
                        alFilter.add(oFilterBean);
                    }
                }
            }
            HashMap<String, String> hmOrder = new HashMap<>();
            if (request.getParameter("order") != null) {
                if (request.getParameter("ordervalue") != null) {
                    hmOrder.put(request.getParameter("order"), request.getParameter("ordervalue"));
                } else {
                    hmOrder = null;
                }
            } else {
                hmOrder = null;
            }
            EntradaDao oEntradaDAO = new EntradaDao(Conexion.getConection());
            int pages = oEntradaDAO.getPages(rpp, alFilter, hmOrder);
            data = "{\"data\":\"" + Integer.toString(pages) + "\"}";
            return data;
        } catch (Exception e) {
            throw new ServletException("EntradaGetpagesJson: View Error: " + e.getMessage());
        }
    }
}
