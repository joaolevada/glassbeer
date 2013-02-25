/* account chart level 1: code, name and remarks */

INSERT INTO tbasicuserrecorddata(
            id, classid, updatecount, code, name, remarks)
    VALUES (3, (select id from modelclasses where objectclassname = 'TBasicUserRecordData'), 1, '0', 'Contas de Saldo/Circulante', 'Conta cadastrada pelo sistema');

INSERT INTO tbasicuserrecorddata(
            id, classid, updatecount, code, name, remarks)
    VALUES (4, (select id from modelclasses where objectclassname = 'TBasicUserRecordData'), 1, '1', 'Entradas/Receitas', 'Conta cadastrada pelo sistema');

INSERT INTO tbasicuserrecorddata(
            id, classid, updatecount, code, name, remarks)
    VALUES (5, (select id from modelclasses where objectclassname = 'TBasicUserRecordData'), 1, '2', 'Saídas/Despesas', 'Conta cadastrada pelo sistema');

/* account chart level 1: level and balance */

INSERT INTO taccountchart(
            id, classid, updatecount, basicuserrecorddata, level, balance)
    VALUES (6, (select id from modelclasses where objectclassname = 'TAccountChart'), 1, 3, 1, '0.00');

INSERT INTO taccountchart(
            id, classid, updatecount, basicuserrecorddata, level, balance)
    VALUES (7, (select id from modelclasses where objectclassname = 'TAccountChart'), 1, 4, 1, '0.00');

INSERT INTO taccountchart(
            id, classid, updatecount, basicuserrecorddata, level, balance)
    VALUES (8, (select id from modelclasses where objectclassname = 'TAccountChart'), 1, 5, 1, '0.00');

  
update glassconfig set dbversion = 8;