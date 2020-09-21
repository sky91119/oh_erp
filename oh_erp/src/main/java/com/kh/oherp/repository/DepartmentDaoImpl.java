package com.kh.oherp.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.oherp.entity.DepartmentDto;

@Repository
public class DepartmentDaoImpl implements DepartmentDao{

   @Autowired
   private SqlSession sqlSession;

   @Override
   public boolean regist(DepartmentDto departmentDto) {
   
      // 같은 부서의 이름이 있는지 조회
      // - 있으면 정보가 나오고 없으면 null
      
      DepartmentDto find = sqlSession.selectOne("department.get", departmentDto.getDepartment_name());
            
      if(find == null) {
         sqlSession.insert("department.regist", departmentDto);
         return true;
      }
      else {         
         return false;
      }
   }

   @Override
   public List<DepartmentDto> list(Model model) {
      List<DepartmentDto> list = sqlSession.selectList("department.getList");
      model.addAttribute("departmentList", list);
      return list;
   }

//   @Override
//   public List<DepartmentDto> search(String type, String keyword, Model model) {
//      Map<String, String> param = new HashMap<>();
//      param.put("type", type);
//      param.put("keyword", keyword);
//      
//   List<DepartmentDto> list = sqlSession.selectList("department.search", param);
//   model.addAttribute("list", list);
//      return list;
//   }

   @Override
   public List<DepartmentDto> search(String type, String keyword, Model model) {
      Map<String, String> map = new HashMap<>();
      
      map.put("type",type);
      map.put("keyword",keyword);
      List<DepartmentDto> list= sqlSession.selectList("department.unionList", map);
      model.addAttribute("departmentList", list);

      return list;
   }

   @Override
   public void delete(int department_no) {
      sqlSession.delete("department.del", department_no);
   }

   @Override
   public void modify(DepartmentDto departmentDto) {
      sqlSession.update("department.mod", departmentDto);
   }

   
}
