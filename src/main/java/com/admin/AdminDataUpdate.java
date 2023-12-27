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
        String studentUname = req.getParameter("stud");
        StudentDao studentDao = new StudentDao();

        if (studentUname.contains("NEW") || "true".equals(req.getParameter("newRecordAttribute"))) {
            handleNewRow(req, studentDao);
        } else {
            Student student = studentDao.getUserDetails(studentUname);
            updateExistingRow(req, student, studentDao);
        }
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

    private void updateExistingRow(HttpServletRequest req, Student student, StudentDao studentDao) {

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

