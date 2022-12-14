/*
  Warnings:

  - You are about to drop the column `campeonatoId` on the `Equipe` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "Dispulta" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "campeonatoId" TEXT NOT NULL,
    CONSTRAINT "Dispulta_campeonatoId_fkey" FOREIGN KEY ("campeonatoId") REFERENCES "Campeonato" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Equipe" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nomeEquipe" TEXT NOT NULL,
    "golsPro" INTEGER DEFAULT 0,
    "golsContra" INTEGER DEFAULT 0,
    "dispultaId" TEXT,
    CONSTRAINT "Equipe_dispultaId_fkey" FOREIGN KEY ("dispultaId") REFERENCES "Dispulta" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Equipe" ("golsContra", "golsPro", "id", "nomeEquipe") SELECT "golsContra", "golsPro", "id", "nomeEquipe" FROM "Equipe";
DROP TABLE "Equipe";
ALTER TABLE "new_Equipe" RENAME TO "Equipe";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
