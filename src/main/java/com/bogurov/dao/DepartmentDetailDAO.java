package com.bogurov.dao;

import com.bogurov.entity.DepartmentDetail;
import com.bogurov.entity.EmployeeDetail;

public interface DepartmentDetailDAO {
    public void saveDepartmentDetail(DepartmentDetail departmentDetail);
    public DepartmentDetail getDepartmentDetail(int id);
    public void deleteDepartmentDetail(int id);
}
