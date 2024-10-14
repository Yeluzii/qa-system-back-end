package top.ychen.qasystem.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Answer {
    private Integer id;
    private String content;
    private Integer questionId;
    private Integer userId;
    private java.sql.Timestamp createdAt;
    private User user;
    private Question question;
}
