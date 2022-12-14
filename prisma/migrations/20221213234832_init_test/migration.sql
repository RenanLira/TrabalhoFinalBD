-- CreateTable
CREATE TABLE "Campeonato" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Equipe" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nomeEquipe" TEXT NOT NULL,
    "golsPro" INTEGER DEFAULT 0,
    "golsContra" INTEGER DEFAULT 0,
    "campeonatoId" TEXT NOT NULL,
    CONSTRAINT "Equipe_campeonatoId_fkey" FOREIGN KEY ("campeonatoId") REFERENCES "Campeonato" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Profissional" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "idade" TEXT NOT NULL,
    "equipeId" TEXT NOT NULL,
    CONSTRAINT "Profissional_equipeId_fkey" FOREIGN KEY ("equipeId") REFERENCES "Equipe" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Jogador" (
    "numeroCamisa" INTEGER NOT NULL,
    "golsMarcado" INTEGER DEFAULT 0,
    "posicao" TEXT NOT NULL DEFAULT 'LINHA',
    "profissionalId" TEXT NOT NULL PRIMARY KEY,
    CONSTRAINT "Jogador_profissionalId_fkey" FOREIGN KEY ("profissionalId") REFERENCES "Profissional" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Treinador" (
    "tatica" TEXT NOT NULL DEFAULT 'EQUILIBRADA',
    "profissionalId" TEXT NOT NULL PRIMARY KEY,
    CONSTRAINT "Treinador_profissionalId_fkey" FOREIGN KEY ("profissionalId") REFERENCES "Profissional" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
