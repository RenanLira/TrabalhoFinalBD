import { CampeonatoRepo } from "./repositories/CampeonatoRepo";
import { EquipeRepo } from "./repositories/EquipeRepo";
import { JogadorRepo } from "./repositories/JogadorRepo";
import { TreinadorRepo } from "./repositories/TreinadorRepo";



const bootstrap = async () => {
    const camp = await new CampeonatoRepo()
    const c1 = await camp.create('campeonato1')

    const equipe = new EquipeRepo()

    const e1 = await equipe.create('Equipe1')
    const e2 = await equipe.create('Equipe2')
    const e3 = await equipe.create('Equipe3')

    const jogador = new JogadorRepo()
    const treinador = new TreinadorRepo()

    const j1 = await jogador.create(19, "Renan", e1.id, 10, "LINHA")
    const t1 = await treinador.create(40, "Rivaldo", "EQUILIBRADA", e1.id) 

    await camp.inserirEquipe(c1.id, e1.id)
    await camp.inserirEquipe(c1.id, e2.id)
    await camp.inserirEquipe(c1.id, e3.id)

}

bootstrap()
