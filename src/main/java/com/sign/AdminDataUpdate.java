package com.sign;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/adminUpdate-servlet")
public class AdminDataUpdate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        //HttpSession session = req.getSession();
        String studentUname = req.getParameter("studentUname");
//        Student student = (Student) req.getAttribute("stud");
        StudentDao studentDao = new StudentDao();
        Student student = studentDao.getUserDetails(studentUname);


        student.setFname(req.getParameter("fname"+student.getId()).isEmpty()? student.getFname() : req.getParameter("fname"+student.getId()));

        student.setDob(req.getParameter("dob"+student.getId()).isEmpty()?student.getDob() : req.getParameter("dob"+student.getId()));

        student.setPhoneNo(req.getParameter("phoneNo"+student.getId()).isEmpty()?student.getPhoneNo() : req.getParameter("phoneNo"+student.getId()));

        student.setUname(req.getParameter("uname"+student.getId()).isEmpty()?student.getUname() : req.getParameter("upassword"+student.getId()));

        student.setUpassword(req.getParameter("upassword"+student.getId()).isEmpty()?student.getUpassword() : req.getParameter("upassword"+student.getId()));

        student.setFather(req.getParameter("father"+student.getId()).isEmpty()? student.getFather() : req.getParameter("father"+student.getId()));

        student.setMother(req.getParameter("mother"+student.getId()).isEmpty()? student.getMother() : req.getParameter("mother"+student.getId()));

        student.setAadhar(req.getParameter("aadhar"+student.getId()).isEmpty()? student.getAadhar() : req.getParameter("aadhar"+student.getId()));

        student.setGender(req.getParameter("gender"+student.getId()).isEmpty()? student.getGender() : req.getParameter("gender"+student.getId()));

        student.setBranch(req.getParameter("branch"+student.getId()).isEmpty()? student.getBranch() : req.getParameter("branch"+student.getId()));

        studentDao.update(student);


    }
}
