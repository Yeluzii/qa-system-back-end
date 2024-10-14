package top.ychen.qasystem.service;

import top.ychen.qasystem.entity.Question;

import java.util.List;

public interface QuestionService {
    void askQuestion(Question question);

    List<Question> getAllQuestions();
    Question findQuestionById(Integer id);

    List<Question> findQuestionByUserId(Integer userId);
    List<Question> findSpecialQuestion(String keyword);
}
