package top.ychen.qasystem.controller;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import top.ychen.qasystem.common.ResponseResult;
import top.ychen.qasystem.entity.Question;
import top.ychen.qasystem.service.QuestionService;

import java.util.List;

@RestController
@RequestMapping("/questions")
public class QuestionController {
    @Resource
    private QuestionService questionService;

    @PostMapping("/ask")
    public ResponseResult<Void> askQuestion(@RequestBody Question question) {
        try {
            questionService.askQuestion(question);
            return ResponseResult.<Void>builder()
                    .code(201)
                    .msg("问题提交成功")
                    .build();
        } catch (Exception e) {
            return ResponseResult.<Void>builder()
                    .code(400)
                    .msg(e.getMessage())
                    .build();
        }
    }

    @GetMapping("/all")
    public ResponseResult<List<Question>> getAllQuestions() {
        List<Question> questions = questionService.getAllQuestions();
        return ResponseResult.<List<Question>>builder()
                .code(200)
                .msg("所有问题获取成功")
                .data(questions)
                .build();
    }

    @GetMapping("/{id}")
    public ResponseResult<Question> findQuestionById(@PathVariable Integer id) {
        try {
            Question question = questionService.findQuestionById(id);
            return ResponseResult.<Question>builder()
                    .code(200)
                    .msg("根据id查到的单个问题获取成功")
                    .data(question)
                    .build();
        } catch (Exception e) {
            return ResponseResult.<Question>builder()
                    .code(404)
                    .msg(e.getMessage())
                    .build();
        }
    }
}