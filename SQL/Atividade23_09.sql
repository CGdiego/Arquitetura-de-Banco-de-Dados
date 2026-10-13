-- Nível: Básico (Consultas Simples)
-- Lista de Presença: Escreva uma query que retorne o nome de todos os alunos cadastrados na escola.
SELECT * FROM alunos;

-- Corpo Docente: Escreva uma query que mostre o nome e a especialidade de todos os professores.
SELECT nome, especialidade FROM professores;

-- Catálogo de Matérias: Escreva uma query que liste todos os nomes das disciplinas (turmas) disponíveis.
SELECT nome_disciplina FROM turmas;


-- Nível: Filtros (Uso do WHERE)
-- Busca Específica: O professor 'Ricardo Santos' precisa ver seus dados. Escreva uma query que selecione apenas as informações dele.
SELECT * FROM professores WHERE nome LIKE 'Ricardo Santos';

-- Filtro de Matéria: Escreva uma query que liste apenas a turma cujo nome seja 'Banco de Dados'.
SELECT * FROM turmas WHERE nome_disciplina LIKE 'Banco de Dados';

-- Pesquisa por Especialidade: Escreva uma query que retorne os professores que dão aula de 'Programação'.
SELECT * FROM professores WHERE especialidade LIKE 'Programação';


-- Nível: Organização e Joins (Relacionamentos)
-- Ordem Alfabética: Liste o nome de todos os alunos, mas organize a lista em ordem alfabética (A-Z).
SELECT nome FROM alunos ORDER BY nome;

-- Quem ensina o quê?: Faça uma consulta que mostre o nome da disciplina ao lado do nome do professor responsável (Dica: Use JOIN entre Turmas e Professores).
SELECT t.nome_disciplina, p.nome AS nome_professor FROM turmas t JOIN professores p ON t.fk_id_professor = p.id_professor;

-- Ocupação das Turmas: Escreva uma query que mostre quais IDs de alunos estão matriculados na Turma de ID número 1 (Dica: Olhe para a tabela Matriculas).
SELECT fk_id_aluno FROM matriculas WHERE fk_id_turma = 1;

-- Desafio Final: Escreva uma query que mostre o nome do aluno e o ID da turma em que ele está matriculado.
SELECT a.nome AS nome_aluno, m.fk_id_turma AS id_turma FROM alunos a JOIN matriculas m ON a.id_aluno = m.fk_id_aluno;