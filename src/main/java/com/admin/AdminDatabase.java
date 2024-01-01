package com.admin;

import com.dao.StudentDao;
import com.signup.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admindatabase-servlet")
public class AdminDatabase extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
        try{
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");
            if (username.equals("Sricharan") && password.equals("charan123")) {
                List<Student> studentDataList = new ArrayList<>();
                StudentDao studentDao = new StudentDao();
                studentDao.getDatabase(studentDataList);
                session.setAttribute("studentDataList",studentDataList);
                resp.sendRedirect("adminDatabase.jsp");
            } else {
                resp.sendRedirect("index.jsp");
            }

        } catch (NullPointerException e) {
            resp.sendRedirect("index.jsp");
        }
    }
}
