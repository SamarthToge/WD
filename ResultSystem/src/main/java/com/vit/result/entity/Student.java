package com.vit.result.entity;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
@Entity @Table(name="students")
public class Student {
 @Id @GeneratedValue(strategy=GenerationType.IDENTITY) private Long id;
 @NotBlank private String prn;
 @NotBlank private String name;
 @NotBlank private String branch;
 @NotBlank private String semester;
 public Long getId(){return id;} public String getPrn(){return prn;} public void setPrn(String v){prn=v;}
 public String getName(){return name;} public void setName(String v){name=v;} public String getBranch(){return branch;} public void setBranch(String v){branch=v;}
 public String getSemester(){return semester;} public void setSemester(String v){semester=v;}
}
