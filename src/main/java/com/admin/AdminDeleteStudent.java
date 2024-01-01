package com.admin;

import com.dao.StudentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AdminDeleteStudent-servlet")
public class AdminDeleteStudent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentUname = req.getParameter("studentUname");
        StudentDao studentDao = new StudentDao();
        studentDao.deleteStudent(studentUname);
        resp.sendRedirect("adminDatabase.jsp");
    }
}
