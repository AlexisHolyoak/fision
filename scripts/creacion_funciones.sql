CREATE OR REPLACE FUNCTION esdbempresarial.fn_ingresar_bandeja(
	in_enviapor 		INTEGER,
	in_fechaingreso 	TIMESTAMP,
	in_fechaatencion 	TIMESTAMP,
	in_causal 			VARCHAR(200),
	in_colaborador 		INTEGER  
	) 
RETURNS VARCHAR(20) AS $$
DECLARE codigo VARCHAR(20);
DECLARE tmpcodigo INTEGER;
	BEGIN
		codigo :='000';
		tmpcodigo := (select max(codigo) +1 from esdbempresarial.TBL_BANDEJA);
		insert into esdbempresarial.TBL_BANDEJA(
			codigo,
			enviapor,
			fechaingreso,
			fechaatencion,
			causal,
			colaborador
		)values(
			tmpcodigo,
			in_enviapor,
			in_fechaingreso,
			in_fechaatencion,
			in_causal,
			in_colaborador
		);
	return codigo;
	exception when others then
		return SQLSTATE;
	END;
$$ LANGUAGE plpgsql;