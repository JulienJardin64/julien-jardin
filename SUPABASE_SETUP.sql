-- Copiez-collez ce SQL dans l'éditeur SQL de Supabase
-- (Table Editor > SQL Editor > New Query)

CREATE TABLE IF NOT EXISTS app_storage (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Autoriser les lectures/écritures publiques (pas de compte requis)
ALTER TABLE app_storage ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Lecture publique" ON app_storage
  FOR SELECT USING (true);

CREATE POLICY "Écriture publique" ON app_storage
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Mise à jour publique" ON app_storage
  FOR UPDATE USING (true);
