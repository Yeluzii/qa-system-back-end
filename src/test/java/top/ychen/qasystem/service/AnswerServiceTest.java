package top.ychen.qasystem.service;

import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import top.ychen.qasystem.entity.Answer;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Slf4j
class AnswerServiceTest {
    @Resource
    private AnswerService answerService;

    @Test
    void answerQuestion() {
        Answer answer = Answer.builder().content("我也不知道").questionId(4).userId(1).build();
        answerService.answerQuestion(answer);
    }

    @Test
    void getAnswerByQuestionId() {
        List<Answer> answers = answerService.getAnswerByQuestionId(4);
        answers.forEach(answer -> log.info("id:{},content:{},createdAt:{}", answer.getId(), answer.getContent(),answer.getCreatedAt()));
    }

    @Test
    void getAnswerByUserId() {
        List<Answer> answers = answerService.getAnswerByUserId(1);
        answers.forEach(answer -> log.info("id:{},content:{},createdAt:{}", answer.getId(), answer.getContent(),answer.getCreatedAt()));
    }
}