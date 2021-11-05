SELECT * from answer;
SELECT * from question;

SELECT
    topic.id as topicID, question.id, question.difficulty, question.question, answer.answer, answer.iscorrect
    FROM question JOIN answer 
    ON question.id=answer.question_id
    JOIN topic
    ON topic.id=question.topic_id
    where topic.id = 1
    and question.difficulty = '1';

   