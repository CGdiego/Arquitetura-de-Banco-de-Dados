-- EXERCÍCIO 1: JOIN Simples entre Alunos e Matrículas

-- Liste o nome de todos os alunos e o ID das turmas em que estão matriculados. Ordene alfabeticamente pelo nome do aluno.
SELECT a.nome, m.fk_id_turma FROM Alunos a JOIN Matriculas m ON a.id_aluno = m.fk_id_aluno ORDER BY a.nome;

-- Exiba o nome do aluno, a disciplina que está cursando e o nome do professor responsável pela turma. Inclua todos os alunos, mesmo que alguma turma não tenha professor atribuído.
SELECT a.nome, t.nome_disciplina, p.nome FROM Alunos a JOIN Matriculas m ON a.id_aluno = m.fk_id_aluno JOIN Turmas t ON m.fk_id_turma = t.id_turma LEFT JOIN Professores p ON t.fk_id_professor = p.id_professor;

-- Mostre o nome de cada professor, sua especialidade e quantos alunos estão matriculados em suas turmas. Exiba os professores mesmo que não tenham nenhum aluno cadastrado.
SELECT p.nome, p.especialidade, COUNT(m.fk_id_aluno) AS quant_alunos FROM Professores p LEFT JOIN Turmas t ON p.id_professor = t.fk_id_professor LEFT JOIN Matriculas m ON t.id_turma = m.fk_id_turma GROUP BY p.id_professor, p.nome, p.especialidade;

-- Liste todos os alunos que estão matriculados em turmas de uma disciplina específica. Use "Matemática" como exemplo na cláusula WHERE. Mostre o nome do aluno e a disciplina.
SELECT a.nome, t.nome_disciplina FROM Alunos a JOIN Matriculas m ON a.id_aluno = m.fk_id_aluno JOIN Turmas t ON m.fk_id_turma = t.id_turma WHERE t.nome_disciplina LIKE '%Matemática%';

-- Encontre todos os pares de alunos que estão matriculados nas mesmas turmas (turmas em comum). Mostre o nome dos dois alunos e o ID da turma onde ambos estão matriculados. Evite mostrar a mesma dupla duas vezes.
SELECT a1.nome AS aluno1, a2.nome AS aluno2, m1.fk_id_turma FROM Matriculas m1 JOIN Matriculas m2 ON m1.fk_id_turma = m2.fk_id_turma AND m1.fk_id_aluno < m2.fk_id_aluno JOIN Alunos a1 ON m1.fk_id_aluno = a1.id_aluno JOIN Alunos a2 ON m2.fk_id_aluno = a2.id_aluno;

-- PARTE 2: EXERCÍCIOS COM SUBQUERYs

-- Liste o ID e nome da disciplina de cada turma, seguido de uma coluna mostrando a quantidade de alunos matriculados em cada uma. Use uma subquery na cláusula SELECT para calcular a quantidade de alunos.
SELECT t.id_turma, t.nome_disciplina, (SELECT COUNT(*) FROM Matriculas m WHERE m.fk_id_turma = t.id_turma) AS quantidade_alunos FROM Turmas t; 

-- Encontre todos os alunos que estão matriculados em turmas de disciplinas que começam com a letra "M". Use uma subquery para identificar primeiro quais são essas turmas.
SELECT a.nome FROM Alunos a JOIN Matriculas m ON a.id_aluno = m.fk_id_aluno WHERE m.fk_id_turma IN (SELECT id_turma FROM Turmas WHERE nome_disciplina LIKE 'M%');

-- Liste todos os professores que têm pelo menos uma turma atribuída a eles. Use o operador EXISTS para verificar se cada professor tem turmas.
SELECT p.nome FROM Professores p WHERE EXISTS (SELECT 1 FROM Turmas t WHERE t.fk_id_professor = p.id_professor);

-- Encontre o professor cuja turma tem o maior número de alunos matriculados. Exiba o nome do professor, o nome da disciplina e a quantidade de alunos.
SELECT p.nome, t.nome_disciplina, sub.quantidade_alunos FROM (SELECT fk_id_turma, COUNT(*) AS quantidade_alunos FROM Matriculas GROUP BY fk_id_turma ORDER BY quantidade_alunos DESC LIMIT 1) sub JOIN Turmas t ON sub.fk_id_turma = t.id_turma JOIN Professores p ON t.fk_id_professor = p.id_professor;

-- Liste todos os alunos que NÃO estão matriculados em nenhuma turma. Use uma subquery com NOT IN para identificá-los.
SELECT a.nome FROM Alunos a WHERE a.id_aluno NOT IN (SELECT m.fk_id_aluno FROM Matriculas m);