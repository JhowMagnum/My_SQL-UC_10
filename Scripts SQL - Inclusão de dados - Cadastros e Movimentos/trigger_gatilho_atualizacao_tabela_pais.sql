-- show triggers;

drop trigger if exists Atualiza_Pais;

-- trigger (gatilho) de atualização da tabela 'pais' quando da inclusão
-- de dados na tabela 'jogos'
delimiter //
create trigger Atualiza_Pais 
	after insert
    on jogos for each row
    begin
		-- vitória da seleção 1
		if new.gols_idpais_1 > new.gols_idpais_2 then
				update pais set 
                pais.pontos = pais.pontos + 3, 
                pais.vitorias = pais.vitorias + 1,
                pais.golspro = pais.golspro + new.gols_idpais_1,
                pais.golscontra = pais.golscontra + new.gols_idpais_2
                where pais.idpais = new.pais_idpais_1;
		end if;
		
        -- vitória da seleção 2
        if new.gols_idpais_1 < new.gols_idpais_2 then
				update pais set 
                pais.pontos = pais.pontos + 3, 
                pais.vitorias = pais.vitorias + 1,
                pais.golspro = pais.golspro + new.gols_idpais_2,
                pais.golscontra = pais.golscontra + new.gols_idpais_1
                where pais.idpais = new.pais_idpais_2;
		end if;
		
        -- empate
        if new.gols_idpais_1 = new.gols_idpais_2 then
				update pais set 
                pais.pontos = pais.pontos + 1, 
                pais.empates = pais.empates + 1,
                pais.golspro = pais.golspro + new.gols_idpais_1,
                pais.golscontra = pais.golscontra + new.gols_idpais_2
                where pais.idpais = new.pais_idpais_1 or
                pais.idpais = new.pais_idpais_2;
		end if;
        
        -- derrota da seleção 1
		if new.gols_idpais_1 < new.gols_idpais_2 then
				update pais set
                pais.derrotas = pais.derrotas + 1,
                pais.golspro = pais.golspro + new.gols_idpais_1,
                pais.golscontra = pais.golscontra + new.gols_idpais_2
                where pais.idpais = new.pais_idpais_1;
		end if;
        
        -- derrota da seleção 2
        if new.gols_idpais_1 > new.gols_idpais_2 then
				update pais set
                pais.derrotas = pais.derrotas + 1,
                pais.golspro = pais.golspro + new.gols_idpais_2,
                pais.golscontra = pais.golscontra + new.gols_idpais_1
                where pais.idpais = new.pais_idpais_2;
		end if;
	end; //