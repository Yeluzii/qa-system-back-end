package top.ychen.qasystem.service;

import top.ychen.qasystem.entity.Answer;

import java.util.List;

public interface AnswerService {
     void answerQuestion(Answer answer);
    List<Answer> getAnswerByQuestionId(Integer questionId);
    List<Answer> getAnswerByPageByQuestionId(Integer questionId, int limit, int offset);
    List<Answer> getAnswerByUserId(Integer userId);
}
