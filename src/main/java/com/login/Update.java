package com.login;

import com.dao.StudentDao;
import com.signup.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/update-servlet")
public class Update extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fname = req.getParameter("fname");
        String dob = req.getParameter("dob");
        String phoneNo = req.getParameter("phoneNo");
//        String uname = req.getParameter("uname");
//        String upassword = req.getParameter("upassword");
        String father = req.getParameter("father");
        String mother = req.getParameter("mother");
        String aadhar = req.getParameter("aadhar");
        String gender = req.getParameter("gender");
        String branch = req.getParameter("branch");

        HttpSession session = req.getSession();
        Student student = (Student) session.getAttribute("user");

            student.setFname(fname.isEmpty()? student.getFname() : fname);
            student.setDob(dob.isEmpty()?student.getDob() : dob);
            student.setPhoneNo(phoneNo.isEmpty()?student.getPhoneNo() : phoneNo);
//        student.setUname(uname);
//        student.setUpassword(upassword);
            student.setFather(father.isEmpty()? student.getFather() : father);

            student.setMother(mother.isEmpty()? student.getMother() : mother);

            student.setAadhar(aadhar.isEmpty()? student.getAadhar() : aadhar);

            student.setGender(gender.isEmpty()? student.getGender() : gender);

            student.setBranch(branch.isEmpty()? student.getBranch() : branch);

        StudentDao studentDao = new StudentDao();
        studentDao.update(student);

        resp.sendRedirect("success.jsp");
    }
}
