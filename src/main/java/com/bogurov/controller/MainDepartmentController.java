package com.bogurov.controller;

import com.bogurov.entity.Department;
import com.bogurov.entity.DepartmentDetail;
import com.bogurov.entity.Employee;
import com.bogurov.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MainDepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @GetMapping("/")
    public String showAllDepartments(Model model){
        List<Department> departments = departmentService.getAllDepartment();
        model.addAttribute("departments", departmentService.getAllDepartment());
        return "allDepartments";
    }

    @GetMapping("/addNewDepartment")
    public String addNewDepartment(Model model){
        Department department = new Department();
        DepartmentDetail detail = new DepartmentDetail();
        department.setDepartmentDetail(detail);
        model.addAttribute("dep", department);
        return "departmentInfo";
    }

    @PostMapping("/saveDepartment")
    public String saveDepartment(@ModelAttribute("dep") Department department){
        departmentService.saveDepartment(department);
        return "redirect:/";
    }

    @GetMapping("/updateDepartment/{depId}")
    public String updateDepartment(@PathVariable int depId, Model model){
        model.addAttribute("dep", departmentService.getDepartment(depId));
        return "departmentInfo";
    }

    @GetMapping("/deleteDepartment/{depId}")
    public String deleteDepartment(@PathVariable int depId){
        departmentService.deleteDepartment(depId);
        return "redirect:/";
    }

    @GetMapping("/listEmployeeFromDepartment/{id}")
    public String listEmployeeFromDepartment(@PathVariable int id, Model model){
        Department department = departmentService.getDepartmentWithEmployees(id);
        List<Employee> employees = department.getEmployee();
        model.addAttribute("allEmps", employees);
        model.addAttribute("depId", id);
        return "allEmployees";
    }


}
