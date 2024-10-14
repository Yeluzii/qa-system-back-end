package top.ychen.qasystem.service;

import top.ychen.qasystem.entity.Answer;

import java.util.List;

public interface AnswerService {
    public void answerQuestion(Answer answer);
    List<Answer> getAnswerByQuestionId(Integer questionId);
    List<Answer> getAnswerByUserId(Integer userId);
}
