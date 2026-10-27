package com.studentcrud;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    public void addStudent(Student student) throws SQLException {
        String sql = "INSERT INTO students (rollno, name, email, age) VALUES (?, ?, ?, ?)";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, student.getRollNo());
            ps.setString(2, student.getName());
            ps.setString(3, student.getEmail());
            ps.setInt(4, student.getAge());
            ps.executeUpdate();
        }
    }

    public List<Student> getAllStudents() throws SQLException {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT rollno, name, email, age FROM students";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                students.add(new Student(
                    rs.getInt("rollno"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getInt("age")
                ));
            }
        }
        return students;
    }

    public Student getStudentByRollNo(int rollNo) throws SQLException {
        String sql = "SELECT rollno, name, email, age FROM students WHERE rollno = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, rollNo);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Student(
                        rs.getInt("rollno"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getInt("age")
                    );
                }
            }
        }
        return null;
    }

    public void updateStudent(Student student) throws SQLException {
        String sql = "UPDATE students SET name = ?, email = ?, age = ? WHERE rollno = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setInt(3, student.getAge());
            ps.setInt(4, student.getRollNo());
            ps.executeUpdate();
        }
    }

    public void deleteStudent(int rollNo) throws SQLException {
        String sql = "DELETE FROM students WHERE rollno = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, rollNo);
            ps.executeUpdate();
        }
    }
}

