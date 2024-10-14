package top.ychen.qasystem.mapper;

import org.apache.ibatis.annotations.Mapper;
import top.ychen.qasystem.entity.Answer;

import java.util.List;

@Mapper
public interface AnswerMapper {
    void insertAnswer(Answer answer);
    List<Answer> findAnswerByQuestionId(Integer questionId);
}
