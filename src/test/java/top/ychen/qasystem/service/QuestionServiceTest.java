package top.ychen.qasystem.service;

import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import top.ychen.qasystem.entity.Question;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Slf4j
class QuestionServiceTest {
    @Resource
    private QuestionService questionService;

    @Test
    void askQuestion() {
        Question question = Question.builder().title("问题和回复一对多怎么弄").content("content111").userId(4).build();
        questionService.askQuestion(question);
    }

    @Test
    void getAllQuestions() {
        List<Question> questions = questionService.getAllQuestions();
        questions.forEach(question -> log.info("id:{},username:{},title:{},content:{},createdAt:{}", question.getId(), question.getUser().getUsername(),question.getTitle(), question.getContent(), question.getCreatedAt()));
    }

    @Test
    void findQuestionById() {
        Question question = questionService.findQuestionById(1);
        log.info("id:{},username:{},title:{},content:{},createdAt:{}", question.getId(), question.getUser().getUsername(),question.getTitle(), question.getContent(), question.getCreatedAt());
    }

    @Test
    void findQuestionByUserId() {
        List<Question> questions = questionService.findQuestionByUserId(4);
        questions.forEach(question -> log.info("id:{},username:{},title:{},content:{},createdAt:{}", question.getId(),question.getUser().getUsername(), question.getTitle(), question.getContent(), question.getCreatedAt()));
    }

    @Test
    void findSpecialQuestion() {
        List<Question> questions = questionService.findSpecialQuestion("怎么");
        questions.forEach(question -> log.info("id:{},username:{},title:{},content:{},userId:{},createdAt:{}", question.getId(), question.getUser().getUsername(),question.getTitle(), question.getContent(), question.getUserId(), question.getCreatedAt()));
    }
}