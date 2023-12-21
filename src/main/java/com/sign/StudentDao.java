package com.sign;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.List;


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

            String querySQL = "INSERT INTO studentstable (id, stname, stdob, stphoneNo, stuname, stpassword) VALUES (?, ?, ?, ?, ?, ?) ; ";
            ps =  con.prepareStatement(querySQL);

            ps.setInt(1,student.getId());
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

    public String[] checkStudent(String uname, String upassword){
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
                throw new RuntimeException(e);
            }
        }
        return new String[]{ dbuname, dbupassword };
    }

    public String isAlreadyExists(String uname, String upassword){

        String dbuname = null;
        String dbupassword = null;

        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/mywebapplicationdb");
            con = ds.getConnection();

            String useDataBase = "USE mywebapplicationdb";
            statement  = con.createStatement();
            statement.executeUpdate(useDataBase);

            String selectQuery = "SELECT * FROM studentstable WHERE stuname = '"+uname+"';";
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
                throw new RuntimeException(e);
            }
        }

        return dbuname;
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
                student.setId(rs.getInt("id"));
                student.setFname(rs.getString("stname"));
                student.setDob(rs.getString("stdob"));
                student.setPhoneNo(rs.getString("stphoneNo"));
                student.setUname(rs.getString("stuname"));
            //    student.setUpassword(rs.getString("stupassword"));
                student.setFather(rs.getString("stfather"));
                student.setMother(rs.getString("stmother"));
                student.setAadhar(rs.getString("staadhar"));
                student.setGender(rs.getString("stgender"));
                student.setBranch(rs.getString("stbranch"));
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
                throw new RuntimeException(e);
            }
        }

        return student;
    }


    public void update(Student student) {
        try{
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/mywebapplicationdb");
            con = ds.getConnection();

            String useDataBase = "USE mywebapplicationdb";
            statement  = con.createStatement();
            statement.executeUpdate(useDataBase);

            String updateQuery = "UPDATE studentstable SET stname = ?, stdob = ?, stphoneNo = ?,stfather = ?,stmother = ?, staadhar = ?,stgender = ?,stbranch = ? WHERE id = "+student.getId();
            ps =  con.prepareStatement(updateQuery);
            ps.setString(1,student.getFname());
            ps.setString(2, student.getDob());
            ps.setString(3,student.getPhoneNo());
            ps.setString(5, student.getUname());
            ps.setString(6,student.getUpassword());
            ps.setString(4,student.getFather());
            ps.setString(5,student.getMother());
            ps.setString(6, student.getAadhar());
            ps.setString(7,student.getGender());
            ps.setString(8,student.getBranch());
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
                throw new RuntimeException(e);
            }
        }
    }


    public void getDatabase(List<Student> studentDataList) {
        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/mywebapplicationdb");
            con = ds.getConnection();

            String useDataBase = "USE mywebapplicationdb";
            statement = con.createStatement();
            statement.executeUpdate(useDataBase);

            String dataQuery = "SELECT * FROM studentstable;";
            ps = con.prepareStatement(dataQuery);
            rs = ps.executeQuery();

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setFname(rs.getString("stname"));
                student.setDob(rs.getString("stdob"));
                student.setPhoneNo(rs.getString("stphoneNo"));
                student.setUname(rs.getString("stuname"));
                student.setUpassword(rs.getString("stpassword"));
                student.setFather(rs.getString("stfather"));
                student.setMother(rs.getString("stmother"));
                student.setAadhar(rs.getString("staadhar"));
                student.setGender(rs.getString("stgender"));
                student.setBranch(rs.getString("stbranch"));
                studentDataList.add(student);
            }

        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (statement != null) statement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void deleteStudent(String presentStudent) {
        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/mywebapplicationdb");
            con = ds.getConnection();

            String useDataBase = "USE mywebapplicationdb";
            statement = con.createStatement();
            statement.executeUpdate(useDataBase);

            String deleteQuery = "DELETE FROM studentstable WHERE stuname = '"+presentStudent+"'";
            statement.executeUpdate(deleteQuery);


        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        }

        finally {
            try{
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (statement != null) statement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
