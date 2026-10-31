package com.vit.result.entity;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
@Entity @Table(name="marks", uniqueConstraints=@UniqueConstraint(columnNames={"student_id","subject_id"}))
public class Mark {
 @Id @GeneratedValue(strategy=GenerationType.IDENTITY) private Long id;
 @ManyToOne(optional=false) private Student student;
 @ManyToOne(optional=false) private Subject subject;
 @Min(0) @Max(30) private double mse;
 @Min(0) @Max(70) private double ese;
 public Long getId(){return id;} public Student getStudent(){return student;} public void setStudent(Student s){student=s;} public Subject getSubject(){return subject;} public void setSubject(Subject s){subject=s;}
 public double getMse(){return mse;} public void setMse(double v){mse=v;} public double getEse(){return ese;} public void setEse(double v){ese=v;} public double getTotal(){return mse+ese;}
}
