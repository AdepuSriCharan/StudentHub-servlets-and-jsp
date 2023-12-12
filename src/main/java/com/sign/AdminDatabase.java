package com.sign;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admindatabase-servlet")
public class AdminDatabase extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        PrintWriter out = resp.getWriter();
//        out.println("<html>");
//        out.println("<body>");
//        out.println("This is in Database servlet");
//        out.println("</body>");
//        out.println("</html>");
//        System.out.println("In Admin Database");
        List<Student> studentDataList = new ArrayList<>();
        StudentDao studentDao = new StudentDao();
        studentDao.getDatabase(studentDataList);
        HttpSession session = req.getSession();
        session.setAttribute("studentDataList",studentDataList);
        resp.sendRedirect("adminDatabase.jsp");

    }
}
