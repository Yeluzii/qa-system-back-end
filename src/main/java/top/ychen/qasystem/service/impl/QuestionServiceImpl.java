package top.ychen.qasystem.service.impl;

import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import top.ychen.qasystem.entity.Question;
import top.ychen.qasystem.mapper.QuestionMapper;
import top.ychen.qasystem.service.QuestionService;

import java.util.List;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Resource
    private QuestionMapper questionMapper;
    @Override
    public void askQuestion(Question question) {
        questionMapper.insertQuestion(question);
    }

    @Override
    public List<Question> getAllQuestions() {
        return questionMapper.findAll();
    }

    @Override
    public Question findQuestionById(Integer id) {
        return questionMapper.findById(id);
    }

    @Override
    public List<Question> findQuestionByUserId(Integer userId) {
        return questionMapper.findByUserId(userId);
    }

    @Override
    public List<Question> findSpecialQuestion(String keyword) {
        return questionMapper.findSpecialQuestion(keyword);
    }
}
