package com.businfo.servlets;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

/**
 *
 * @author heerd
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
 
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("working");
         Connection con;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/userinfo","root","maheer2709");
            
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String gender=request.getParameter("gender");
            
            String sql="INSERT INTO users VALUES(?,?,?,?,?)";
            PreparedStatement pst=con.prepareStatement(sql);
            
            pst.setString(1,name);
                pst.setString(2,email);
                
            pst.setString(3,username);
                
            pst.setString(4,password);
                
            pst.setString(5,gender);
            
              
          pst.executeUpdate();
          RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
            rd.forward(request,response);
          
          
        }
          catch(ServletException | IOException | ClassNotFoundException | SQLException e){
              RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
            rd.forward(request,response);
            
        }
    }

  

}
