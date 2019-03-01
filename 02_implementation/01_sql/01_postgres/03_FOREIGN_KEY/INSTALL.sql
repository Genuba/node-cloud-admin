/* Create Foreign Key Constraints */

ALTER TABLE ab_core_us.acu_tacue ADD CONSTRAINT fk_acu_tacue_au_tcompany
	FOREIGN KEY (company_company) REFERENCES ab_core_us.acu_tcompany (company_company) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.acu_tcompany ADD CONSTRAINT fk_acu_tcompany_acu_taccount
	FOREIGN KEY (account_account) REFERENCES ab_core_us.acu_account (account_account) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.au_tlogin ADD CONSTRAINT fk_au_tlogin_au_user
	FOREIGN KEY (user_user) REFERENCES ab_core_us.au_tuser (user_user) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.au_tmembership ADD CONSTRAINT fk_au_tmembership_acu_company
	FOREIGN KEY (company_company) REFERENCES ab_core_us.acu_tcompany (company_company) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.au_tmembership ADD CONSTRAINT fk_au_tmembership_au_trol
	FOREIGN KEY (rol_rol) REFERENCES ab_core_us.au_trol (rol_rol) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.au_tmembership ADD CONSTRAINT fk_au_tmembership_au_user
	FOREIGN KEY (user_user) REFERENCES ab_core_us.au_tuser (user_user) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.cl_tclient ADD CONSTRAINT fk_cl_tclient_au_tcompany
	FOREIGN KEY (company_company) REFERENCES ab_core_us.acu_tcompany (company_company) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.cl_tconsum ADD CONSTRAINT FK_cl_tconsum_cl_tclient
	FOREIGN KEY (client_client) REFERENCES ab_core_us.cl_tclient (client_client) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.cl_treceipt ADD CONSTRAINT FK_cl_treceipt_cl_tclient
	FOREIGN KEY (client_client) REFERENCES ab_core_us.cl_tclient (client_client) ON DELETE No Action ON UPDATE No Action
;
