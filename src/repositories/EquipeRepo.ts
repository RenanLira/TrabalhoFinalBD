import { Campeonato, PrismaClient } from "@prisma/client";

export class EquipeRepo {

    repo = new PrismaClient()


    async create(nomeEquipe: string) {

        const result = await this.repo.equipe.create({
            data: {
                nomeEquipe
            }
        })

        return result

    }
    


}