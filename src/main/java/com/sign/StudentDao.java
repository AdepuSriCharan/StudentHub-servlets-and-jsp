package com.sign;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;


public class StudentDao {
        Context ctx = null;
        Connection con = null;
        Statement statement = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        //String tablename = "studentstable";
    public void registerStudent(Student student ) {

        try{
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/mywebapplicationdb");
            con = ds.getConnection();

            String useDataBase = "USE mywebapplicationdb";
            statement  = con.createStatement();
            statement.executeUpdate(useDataBase);

            String querySQL = "INSERT INTO studentstable (idstudentstable, stname, stdob, stphoneNo, stuname, stpassword) VALUES (?, ?, ?, ?, ?, ?) ; ";
            ps =  con.prepareStatement(querySQL);

            ps.setInt(1,5);
            ps.setString(2,student.getFname());
            ps.setString(3, student.getDob());
            ps.setString(4,student.getPhoneNo());
            ps.setString(5, student.getUname());
            ps.setString(6,student.getUpassword());
            ps.executeUpdate();


        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        }

        finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (statement != null) statement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                // handle exception during resource closing
            }
        }

    }

    public int checkStudent(String uname,String upassword){
        String dbuname = null;
        String dbupassword = null;

        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/mywebapplicationdb");
            con = ds.getConnection();

            String useDataBase = "USE mywebapplicationdb";
            statement  = con.createStatement();
            statement.executeUpdate(useDataBase);

            String selectQuery = "SELECT * FROM studentstable WHERE stuname = '"+uname+"' AND stpassword = '"+upassword+"';";
            ps = con.prepareStatement(selectQuery);
            rs = ps.executeQuery();
            if(rs.next()){
                dbuname = rs.getString("stuname");
                dbupassword = rs.getString("stpassword");
                //System.out.println("name ="+dbuname+" | password ="+dbupassword);
            }

        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        }



        finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (statement != null) statement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                // handle exception during resource closing
            }
        }

        if(uname.equals(dbuname) && upassword.equals(dbupassword)){
            return 1;
        }
        else
            return 0;

    }

    public Student getUserDetails(String username) {

        Student student = new Student();
        try{
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/mywebapplicationdb");
            con = ds.getConnection();

            String useDataBase = "USE mywebapplicationdb";
            statement  = con.createStatement();
            statement.executeUpdate(useDataBase);
            String selectUserDetails = "SELECT * FROM studentstable WHERE stuname = '"+username+"';";
            ps = con.prepareStatement(selectUserDetails);
            rs = ps.executeQuery();
            if(rs.next()){
//                dbuname = rs.getString("stuname");
//                dbupassword = rs.getString("stpassword");
                student.setFname(rs.getString("stname"));
                student.setDob(rs.getString("stdob"));
                student.setPhoneNo(rs.getString("stphoneNo"));
                student.setUname(rs.getString("stuname"));
                student.setUpassword("stupassword");
            }


        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        }

        return student;
    }


}
