package com.bogurov.controller;

import com.bogurov.entity.Department;
import com.bogurov.entity.Employee;
import com.bogurov.entity.EmployeeDetail;
import com.bogurov.service.DepartmentService;
import com.bogurov.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/employees")
public class MainEmployeeController {

    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private DepartmentService departmentService;
/*
    @GetMapping("/")
    public String showAllEmployees(Model model) {
        List<Employee> employees = employeeService.getAllEmployees();
        model.addAttribute("allEmps", employees);
        return "allEmployees";
    }*/

    @GetMapping("/{id}/addNewEmployee")
    public String addNewEmployee(@PathVariable int id, Model model) {
        System.out.println("Add");
        Employee employee = new Employee();
        EmployeeDetail employeeDetail = new EmployeeDetail();
        model.addAttribute("depId", id);
        model.addAttribute("emp", employee);
        model.addAttribute("empDetail", employeeDetail);
        return "employeeInfo";
    }

    @RequestMapping("/{id}/saveEmployee")
    public String saveEmployee(@PathVariable int id,
                               @ModelAttribute("emp") Employee employee,
                               @ModelAttribute("empDetail") EmployeeDetail employeeDetail) {
        employee.setDepartment(departmentService.getDepartment(id));
        employee.setEmployeeDetail(employeeDetail);
        employeeService.saveEmployee(employee);
        return "redirect:/listEmployeeFromDepartment/" + id;
    }

    @RequestMapping("/{id}/updateInfo")
    public String updateEmployee(@PathVariable int id,
                                 @RequestParam("empId") int empId,
                                 Model model) {
        Employee employee = employeeService.getEmployee(empId);
        model.addAttribute("depId", id);
        model.addAttribute("emp", employee);
        model.addAttribute("empDetail", employee.getEmployeeDetail());
        return "employeeInfo";
    }

    @RequestMapping("/{id}/deleteEmployee")
    public String deleteEmployee(@PathVariable int id,
                                 @RequestParam("empId") int empId) {
        employeeService.deleteEmployee(empId);
        return "redirect:/listEmployeeFromDepartment/" + id;
    }
}
