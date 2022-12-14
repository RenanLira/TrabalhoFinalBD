/*
  Warnings:

  - You are about to alter the column `idade` on the `Profissional` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Profissional" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "idade" INTEGER NOT NULL,
    "equipeId" TEXT NOT NULL,
    CONSTRAINT "Profissional_equipeId_fkey" FOREIGN KEY ("equipeId") REFERENCES "Equipe" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Profissional" ("equipeId", "id", "idade", "nome") SELECT "equipeId", "id", "idade", "nome" FROM "Profissional";
DROP TABLE "Profissional";
ALTER TABLE "new_Profissional" RENAME TO "Profissional";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
