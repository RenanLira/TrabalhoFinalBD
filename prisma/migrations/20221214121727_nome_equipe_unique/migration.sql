-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Dispulta" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "limiteEquipes" INTEGER NOT NULL DEFAULT 2,
    "campeonatoId" TEXT NOT NULL,
    CONSTRAINT "Dispulta_campeonatoId_fkey" FOREIGN KEY ("campeonatoId") REFERENCES "Campeonato" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Dispulta" ("campeonatoId", "id") SELECT "campeonatoId", "id" FROM "Dispulta";
DROP TABLE "Dispulta";
ALTER TABLE "new_Dispulta" RENAME TO "Dispulta";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
