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
import java.io.PrintWriter;
import java.util.Objects;

@WebServlet("/adminUpdate-servlet")
public class AdminDataUpdate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studIdParam = req.getParameter("studId");
        HttpSession session = req.getSession();

        StudentDao studentDao = new StudentDao();

        if(!Objects.equals(studIdParam, "newId")){
            int studId = Integer.parseInt(studIdParam);
            Student student = (Student) session.getAttribute("stud"+studId);
            if(studId == student.getId())
                updateExistingRow(req, resp, student, studentDao);
            else
                resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Error!!!');");
            out.println("window.location.href='adminDatabase.jsp';");
            out.println("</script>");
        } else {
            String dbuname = studentDao.isAlreadyExists(req.getParameter("uname"));
            if(req.getParameter("uname").equals(dbuname)){
                resp.setContentType("text/html;charset=UTF-8");
                PrintWriter out = resp.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Student with username " + dbuname + " already exists.');");
                out.println("window.location.href='adminDatabase.jsp';");
                out.println("</script>");
            }
            else {
                handleNewRow(req, studentDao);
                resp.sendRedirect("adminDatabase.jsp");

            }
        }

    }
    private void handleNewRow(HttpServletRequest req, StudentDao studentDao) {
        Student newStudent = new Student();
        newStudent.setFname(req.getParameter("fname"));
        newStudent.setDob(req.getParameter("dob"));
        newStudent.setPhoneNo(req.getParameter("phoneNo"));
        newStudent.setUname(req.getParameter("uname"));
        newStudent.setUpassword(req.getParameter("upassword"));
        newStudent.setFather(req.getParameter("father"));
        newStudent.setMother(req.getParameter("mother"));
        newStudent.setAadhar(req.getParameter("aadhar"));
        newStudent.setGender(req.getParameter("gender"));
        newStudent.setBranch(req.getParameter("branch"));


        studentDao.registerStudent(newStudent);
    }

    private void updateExistingRow(HttpServletRequest req, HttpServletResponse resp, Student student, StudentDao studentDao) throws IOException {
        student.setFname(req.getParameter("fname"));

        student.setDob(req.getParameter("dob"));

        student.setPhoneNo(req.getParameter("phoneNo"));

        student.setUname(req.getParameter("uname"));

        student.setUpassword(req.getParameter("upassword"));

        student.setFather(req.getParameter("father"));

        student.setMother(req.getParameter("mother"));

        student.setAadhar(req.getParameter("aadhar"));

        student.setGender(req.getParameter("gender"));

        student.setBranch(req.getParameter("branch"));

        studentDao.update(student);

        resp.sendRedirect("adminDatabase.jsp");
    }
}
