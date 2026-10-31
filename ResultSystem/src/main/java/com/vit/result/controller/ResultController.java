package com.vit.result.controller;
import com.vit.result.entity.*; import com.vit.result.repository.*; import org.springframework.stereotype.Controller; import org.springframework.ui.Model; import org.springframework.web.bind.annotation.*; import java.util.*;
@Controller
public class ResultController {
 private final StudentRepository students; private final SubjectRepository subjects; private final MarkRepository marks;
 public ResultController(StudentRepository s, SubjectRepository sub, MarkRepository m){students=s;subjects=sub;marks=m;}
 @GetMapping("/") public String home(){return "index";}
 @GetMapping("/result") public String result(@RequestParam String prn, Model model){
   Optional<Student> st=students.findByPrn(prn.trim()); if(st.isEmpty()){model.addAttribute("error","No student found for PRN: "+prn); return "index";}
   List<Mark> rows=marks.findByStudent(st.get()); rows.sort(Comparator.comparing(x->x.getSubject().getName()));
   double total=rows.stream().mapToDouble(Mark::getTotal).sum(); double percentage=rows.isEmpty()?0:total/(rows.size()*100.0)*100;
   model.addAttribute("student",st.get()); model.addAttribute("marks",rows); model.addAttribute("total",total); model.addAttribute("percentage",percentage); return "result";
 }
 @GetMapping("/admin") public String admin(Model model){model.addAttribute("students",students.findAll());model.addAttribute("subjects",subjects.findAll()); return "admin";}
 @PostMapping("/admin/student") public String addStudent(Student s){students.save(s); return "redirect:/admin";}
 @PostMapping("/admin/seed") public String seed(){
   String[] names={"Data Structures and Algorithms","Operating Systems","Database Management Systems","Object Oriented Programming"};
   for(String n:names) subjects.findAll().stream().filter(x->x.getName().equals(n)).findFirst().orElseGet(()->subjects.save(new Subject(n)));
   return "redirect:/admin";
 }
 @PostMapping("/admin/marks") public String addMarks(@RequestParam Long studentId,@RequestParam Long subjectId,@RequestParam double mse,@RequestParam double ese){
   Student s=students.findById(studentId).orElseThrow(); Subject sub=subjects.findById(subjectId).orElseThrow();
   Mark m=marks.findByStudent(s).stream().filter(x->x.getSubject().getId().equals(subjectId)).findFirst().orElseGet(Mark::new); m.setStudent(s);m.setSubject(sub);m.setMse(mse);m.setEse(ese);marks.save(m); return "redirect:/admin";
 }
}
