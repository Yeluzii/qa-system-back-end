package top.ychen.qasystem.service.impl;

import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import top.ychen.qasystem.entity.Answer;
import top.ychen.qasystem.mapper.AnswerMapper;
import top.ychen.qasystem.service.AnswerService;

import java.util.List;

@Service
public class AnswerServiceImpl implements AnswerService {
    @Resource
    private AnswerMapper answerMapper;
    @Override
    public void answerQuestion(Answer answer) {
        answerMapper.insertAnswer(answer);
    }

    @Override
    public List<Answer> getAnswerByQuestionId(Integer questionId) {
        return answerMapper.findAnswerByQuestionId(questionId);
    }

    @Override
    public List<Answer> getAnswerByUserId(Integer userId) {
        return answerMapper.findAnswerByUserId(userId);
    }
}
