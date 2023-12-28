package com.admin;

import com.dao.StudentDao;
import com.signup.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/adminUpdate-servlet")
public class AdminDataUpdate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentUname = req.getParameter("uname");
        StudentDao studentDao = new StudentDao();

            Student student = studentDao.getUserDetails(studentUname);
            updateExistingRow(req,resp, student, studentDao);

    }

    private void handleNewRow(HttpServletRequest req, StudentDao studentDao) {
        Student newStudent = new Student();
        newStudent.setFname(req.getParameter("fnameNEW"));
        newStudent.setDob(req.getParameter("dobNEW"));
        newStudent.setPhoneNo(req.getParameter("phoneNoNEW"));
        newStudent.setUname(req.getParameter("unameNEW"));
        newStudent.setUpassword(req.getParameter("upasswordNEW"));
        newStudent.setFather(req.getParameter("fatherNEW"));
        newStudent.setMother(req.getParameter("motherNEW"));
        newStudent.setAadhar(req.getParameter("aadharNEW"));
        newStudent.setGender(req.getParameter("genderNEW"));
        newStudent.setBranch(req.getParameter("branchNEW"));


        studentDao.registerStudent(newStudent);
    }

    private void updateExistingRow(HttpServletRequest req,HttpServletResponse resp, Student student, StudentDao studentDao) throws IOException {

        student.setFname(req.getParameter("fname").isEmpty()? student.getFname() : req.getParameter("fname"));

        student.setDob(req.getParameter("dob").isEmpty()?student.getDob() : req.getParameter("dob"));

        student.setPhoneNo(req.getParameter("phoneNo").isEmpty()?student.getPhoneNo() : req.getParameter("phoneNo"));

        student.setUname(req.getParameter("uname").isEmpty()?student.getUname() : req.getParameter("upassword"+student.getId()));

        student.setUpassword(req.getParameter("upassword").isEmpty()?student.getUpassword() : req.getParameter("upassword"));

        student.setFather(req.getParameter("father").isEmpty()? student.getFather() : req.getParameter("father"));

        student.setMother(req.getParameter("mother").isEmpty()? student.getMother() : req.getParameter("mother"));

        student.setAadhar(req.getParameter("aadhar").isEmpty()? student.getAadhar() : req.getParameter("aadhar"));

        student.setGender(req.getParameter("gender").isEmpty()? student.getGender() : req.getParameter("gender"));

        student.setBranch(req.getParameter("branch").isEmpty()? student.getBranch() : req.getParameter("branch"));

        studentDao.update(student);
        resp.sendRedirect("adminDatabase.jsp");
    }
}

