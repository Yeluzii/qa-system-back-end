package top.ychen.qasystem.mapper;

import org.apache.ibatis.annotations.Mapper;
import top.ychen.qasystem.entity.Question;

import java.util.List;

@Mapper
public interface QuestionMapper {
    void insertQuestion(Question question);
    List<Question> findAll();
    Question findById(Integer id);
    List<Question> findByUserId(Integer userId);
    List<Question> findSpecialQuestion(String keyword);
}
