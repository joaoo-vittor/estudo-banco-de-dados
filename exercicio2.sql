create database exercicio;

use exercicio;

create table funcionarios(
  idFuncionario integer,
  nome varchar(100),
  email varchar(200),
  sexo varchar(10),
  departamento varchar(100),
  admissao varchar(10),
  salario integer,
  cargo varchar(100),
  idRegiao int
);

SELECT * FROM funcionarios;
select count(*) from funcionarios;

--Traga os funcionarios que trabalhem
--no departamento de filmes OU no
--departamento de roupas


select departamento, count(*)
from funcionarios
group by departamento;


select departamento, count(*) as "quantidade"
from funcionarios
group by departamento
order by 2;
-- order by 2 -> ordena pela primeira coluna

select nome, departamento
from funcionarios
where departamento = 'Roupas'
or departamento = 'Filmes';

--O gestor de marketing pediu a lista das funcionarias (AS) = FEMININO que trabalhem no departamento 
--de filmes ou no departamento lar. Ele necessita enviar um email para as colaboradoras
--desses dois setores. OR +  AND *


select departamento, count(*) as "quantidade"
from funcionarios
group by departamento;

select sexo, count(*) as "quantidade"
from funcionarios
group by sexo;


-- ESSE CODIGO NÃO É PERFORMATICO
select nome, departamento, email
from funcionarios
where sexo = 'Feminino' 
and (departamento = 'Lar' or departamento = 'Filmes');


select nome, departamento, email
from funcionarios
where  
( departamento = 'Lar' and sexo = 'Feminino' )
or
( departamento = 'Filmes' and sexo = 'Feminino' );

--Traga os funcionarios do sexo masculino
--ou os funcionarios que trabalhem no setor Jardim

-- sexo  |  484
-- Jardim  |  47

select nome, departamento, email
from funcionarios
where sexo = 'Masculino' 
or departamento = 'Jardim';

