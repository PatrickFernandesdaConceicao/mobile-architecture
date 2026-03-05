# Questionário de Reflexão — Atividade 2

**Disciplina:** Desenvolvimento para Dispositivos Móveis II  
**Tema:** Refatoração Arquitetural com Arquitetura em Camadas no Flutter

---

## 1. Em qual camada foi implementado o mecanismo de cache? Explique por que essa decisão é adequada dentro da arquitetura proposta.

Na **camada Data**, como um datasource de cache integrado ao repositório. É a camada adequada pois é responsável pelo acesso a dados, sejam remotos ou locais, mantendo o ViewModel e a interface sem conhecimento de onde os dados vêm.

---

## 2. Por que o ViewModel não deve realizar chamadas HTTP diretamente?

Porque sua responsabilidade é gerenciar o estado da interface, não acessar dados. Chamadas HTTP pertencem à camada Data. Fazê-las no ViewModel criaria acoplamento indevido com a infraestrutura e dificultaria os testes.

---

## 3. O que poderia acontecer se a interface acessasse diretamente o DataSource?

A interface assumiria responsabilidades que não lhe cabem, ficando acoplada a detalhes técnicos de rede e formato de dados. O código se tornaria difícil de manter e testar, violando a regra de dependência da arquitetura.

---

## 4. Como essa arquitetura facilitaria a substituição da API por um banco de dados local?

Bastaria criar uma nova implementação do repositório que usa um banco local em vez da API. ViewModel, páginas e entidades continuariam sem alterações, pois dependem apenas do contrato abstrato definido no domínio.

---
