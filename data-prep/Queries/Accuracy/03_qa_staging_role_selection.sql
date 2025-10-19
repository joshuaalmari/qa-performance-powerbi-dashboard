CREATE TABLE role_to_process(
	role_selection text PRIMARY KEY,
	process_name text NOT NULL
);

INSERT INTO role_to_process(role_selection, process_name)
VALUES
-- AR
('AR', 'AR'), 
('AR Voice', 'AR'),
('AR Non-voice', 'AR'), 

-- Cash Posting
('Cash Posting', 'Cash Posting'),

-- Confirmations
('Confirmations', 'Confirmations'),
('Pre Confirmation', 'Confirmations'),

-- CPTM
('CPTM', 'CPTM'),

-- Documentation
('Documentation', 'Documentation'),
('Documentation Recertification', 'Documentation'),

-- Initial Auth
('Initial Authorization/Snap', 'Initial Auth'),

-- Insurance Verification
('Insurance Verification', 'Insurance Verification'),

-- Intake
('Intake', 'Intake'),
('Intake order creation', 'Intake'),
('Intake Qualifications', 'Intake'),
('Orthotic Intake Process', 'Intake'),
('Orthotic/HME Intake', 'Intake'),
('Diabetes Intake', 'Intake'),
('Diabetes Intake & Intake Reorder', 'Intake'),
('PCS CSR', 'Intake'),

-- PAP Processes
('PAP Resupply Held', 'PAP Resuppy Held'),
('PAP Resupply IV', 'PAP Resupply IV'), 
('PAP Scheduling', 'PAP Scheduling'),
('Resupply Documentation', 'PAP Resupply Docs'),

-- Payor Change (fixing typos)
('Payor Change', 'Payor Change'),
('Payor Chnage', 'Payor Change'),

-- Patient Unapplied
('Patient Unapplied', 'Patient Unapplied'),
('Refund/Credits/Reship-Recoup', 'Patient Unapplied'),

-- PCS Documentation
('PCS Documentation', 'PCS Documentation'),

-- ReAuth
('ReAuth', 'ReAuth'),
('ReAuth Voice', 'ReAuth'),
('ReAuth Non-Voice', 'ReAuth'),
('Re-Auth', 'ReAuth'),

-- Stop Held
('Stop/Held', 'Stop/Held'),
('Stop/Held-ARM Review', 'Stop/Held'),

-- Vent Compliance
('Vent Compliance', 'Vent Compliance'),
('Vent', 'Vent Compliance'),

-- 60 MC Restart
('60 MC Restart', '60 MC Restart'),
('60 MC Restart/Mountain', '60 MC Restart'),

-- VNSQY
('VNSWY', 'VNSWY');