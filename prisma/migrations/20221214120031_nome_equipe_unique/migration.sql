/*
  Warnings:

  - A unique constraint covering the columns `[nomeEquipe]` on the table `Equipe` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Equipe_nomeEquipe_key" ON "Equipe"("nomeEquipe");
